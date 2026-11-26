$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$prior = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-predicate-proof/run.ps1"
$qualifiedRunnerDir = $PSScriptRoot
. "$root/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $prior
$hash = (Get-FileHash -LiteralPath $prior -Algorithm SHA256).Hash
if ($hash -ine '8b5e3ffaff09bb71af092eff030e1dafdd0d210d7176e6eedf56435703b87afc') {
    throw 'Prior offline runner fingerprint changed'
}

# Preserve the prior run: redirect its pinned offline launcher in memory.
$launcher = [IO.File]::ReadAllText($prior)
$launcher = $launcher.Replace('20261119T215954Z-pop-predicate-proof', '20261119T215954Z-pop-qualified-proof')
$launcher = $launcher.Replace('.tmp/m2popfix', '.tmp/m2popq')
$launcher = $launcher.Replace('$PSScriptRoot', '$qualifiedRunnerDir')
& ([ScriptBlock]::Create($launcher))
