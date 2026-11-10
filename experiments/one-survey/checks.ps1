param([Parameter(Mandatory=$true)][ValidateSet('baseline','boundaries','green')][string]$Phase,
      [Parameter(Mandatory=$true)][ValidatePattern('^[a-zA-Z0-9-]+$')][string]$RunId)
$ErrorActionPreference = 'Stop'
$launcher = "$PSScriptRoot/run.ps1"
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$runtime = "$root/.tmp/one-survey/$RunId"
if ((Get-Location).Path.Replace('\','/') -ne $root) { throw 'Wrong checkout' }
. "$PSScriptRoot/paths.ps1"
Assert-OneSurveyTree $runtime -Output
function Assert($condition, $message) { if (!$condition) { throw $message } }
function Invoke-Expected($mode, $id, $fails, $reason = '') {
    $before = [Environment]::GetEnvironmentVariables('Process')
    $preference = $ErrorActionPreference
    $failed = $false
    $failure = ''
    try { & $launcher -Mode $mode -RunId $id } catch {
        $failed = $true
        $failure = $_.ToString()
        "Expected/observed child error: $_"
    }
    Assert ($failed -eq $fails) "Unexpected outcome for $mode/$id"
    if ($fails) { Assert ($reason -and $failure -match $reason) "Wrong failure for $mode/$id`: $failure" }
    $after = [Environment]::GetEnvironmentVariables('Process')
    Assert ($before.Count -eq $after.Count) 'Environment key count changed'
    foreach ($key in $before.Keys) {
        Assert ($before[$key] -ceq $after[$key]) "Caller environment changed: $key"
    }
    Assert ($ErrorActionPreference -eq $preference) 'Error preference changed'
}
if ($Phase -eq 'baseline') {
    Invoke-Expected 'baseline' $RunId $true 'R baseline failed with exit'
    Assert (Test-Path "$runtime/logs/baseline.log") 'No usable-package red log'
    Assert ([IO.File]::ReadAllText("$runtime/logs/baseline.log") -match "no package called 'pipfun'") 'Baseline failed for a different reason'
    'P2.1: actual usable installed-package baseline RED; no install performed'
}
if ($Phase -eq 'boundaries') {
    # Fixtures are siblings, never descendants of a runtime used for positives.
    $testRoot = "$root/.tmp/one-survey/$RunId-fixtures"
    function New-FixtureDirectory($path) {
        Assert-OneSurveyTree $path -Output
        if (Test-Path -LiteralPath $path) { throw "Fixture already exists: $path" }
        [IO.Directory]::CreateDirectory($path) | Out-Null
    }
    New-FixtureDirectory $testRoot
    Start-Transcript -Path "$testRoot/checks.log" | Out-Null
    try {
    # These exercise this helper's own guard, before its first fixture write.
    $rejected = $false
    try { & $PSCommandPath -Phase boundaries -RunId '../escape' } catch {
        $rejected = $_.ToString() -match '(?s)Cannot validate argument.*RunId'
    }
    Assert $rejected 'Helper accepted a traversal ID or failed for the wrong reason'
    $helperId = "$RunId-helper-redirect"
    $helperTarget = "$testRoot/helper-target"
    New-FixtureDirectory $helperTarget
    $helperLink = "$root/.tmp/one-survey/$helperId-fixtures"
    Assert-OneSurveyTree $helperLink -Output
    Assert (!(Test-Path -LiteralPath $helperLink)) 'Old helper redirect fixture'
    New-Item -ItemType Junction -Path $helperLink -Target $helperTarget | Out-Null
    $rejected = $false
    try { & $PSCommandPath -Phase boundaries -RunId $helperId } catch {
        $rejected = $_.ToString() -match 'Redirected output/source:'
    }
    Assert $rejected 'Helper did not reject its own redirected fixture root'
    Assert ([IO.Directory]::GetFileSystemEntries($helperTarget).Length -eq 0) 'Helper wrote through redirect'
    foreach ($name in @('base-library','logs','sources','library')) {
        $id = "$RunId-negative-$name"
        $destination = "$root/.tmp/one-survey/$id"
        New-FixtureDirectory $destination
        $target = "$testRoot/$name"
        New-FixtureDirectory $target
        New-Item -ItemType Junction -Path "$destination/$name" -Target $target | Out-Null
        Invoke-Expected 'setup' $id $true 'Redirected recursive target/source:'
        Assert ([IO.Directory]::GetFileSystemEntries($target).Length -eq 0) 'Redirect target written'
        Assert (!(Test-Path "$destination/temp")) 'Write occurred before rejection'
    }
    foreach ($name in @('sources','library')) {
        $id = "$RunId-populated-$name"
        $destination = "$root/.tmp/one-survey/$id"
        New-FixtureDirectory "$destination/$name"
        [IO.File]::WriteAllText("$destination/$name/sentinel", 'preserve')
        Invoke-Expected 'setup' $id $true 'Attempt already exists;'
        Assert ([IO.File]::ReadAllText("$destination/$name/sentinel") -eq 'preserve') 'Old data changed'
        Assert (!(Test-Path "$destination/temp")) 'Write occurred before reuse rejection'
    }
    $id = "$RunId-negative-file"
    $destination = "$root/.tmp/one-survey/$id"
    New-FixtureDirectory "$destination/logs"
    [IO.File]::WriteAllText("$testRoot/log-target", 'untouched')
    New-Item -ItemType HardLink -Path "$destination/logs/setup.log" -Target "$testRoot/log-target" | Out-Null
    Invoke-Expected 'setup' $id $true 'Hard-linked target/source:'
    Assert ([IO.File]::ReadAllText("$testRoot/log-target") -eq 'untouched') 'Linked log target written'
    Assert (!(Test-Path "$destination/temp")) 'Write occurred before linked-log rejection'
    $id = "$RunId-negative-ancestor"
    New-FixtureDirectory "$testRoot/ancestor"
    Assert-OneSurveyTree "$root/.tmp/one-survey/$id" -Output
    Assert (!(Test-Path -LiteralPath "$root/.tmp/one-survey/$id")) 'Old ancestor fixture'
    New-Item -ItemType Junction -Path "$root/.tmp/one-survey/$id" -Target "$testRoot/ancestor" | Out-Null
    Invoke-Expected 'setup' $id $true 'Redirected output/source:'
    Assert (!(Test-Path "$testRoot/ancestor/temp")) 'Redirected ancestor written'
    Assert-OneSurveyTree $runtime -Output
    'V1/V3: 10 specific helper/launcher negative controls passed; positive runtime remains unlinked'
    } finally { Stop-Transcript | Out-Null }
}
if ($Phase -eq 'green') {
    # Exercise both previous and unset values through success and forced failure.
    $oldHome = [Environment]::GetEnvironmentVariable('HOME','Process')
    $oldTests = [Environment]::GetEnvironmentVariable('R_TESTS','Process')
    try {
        [Environment]::SetEnvironmentVariable('HOME', "$runtime/caller-home", 'Process')
        [Environment]::SetEnvironmentVariable('R_TESTS', $null, 'Process')
        Invoke-Expected 'check' $RunId $false
        Assert (!(Test-Path -LiteralPath "$runtime/logs/forced-failure.log")) 'Old forced-child log'
        Invoke-Expected 'forced-failure' $RunId $true 'R forced-failure failed with exit'
        Assert ([IO.File]::ReadAllText("$runtime/logs/forced-failure.log") -match
            'Intentional child failure for restoration') 'No intentional R-child failure marker'
    } finally {
        [Environment]::SetEnvironmentVariable('HOME', $oldHome, 'Process')
        [Environment]::SetEnvironmentVariable('R_TESTS', $oldTests, 'Process')
    }
    'P2.4: all environment keys and error preference restored on success and forced failure'
}
