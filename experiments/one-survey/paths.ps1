function Assert-OneSurveyTree([string]$Path, [switch]$Output) {
    $full = [IO.Path]::GetFullPath($Path).Replace('\','/')
    $checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
    if ($Output -and !$full.StartsWith("$checkout/", [StringComparison]::OrdinalIgnoreCase)) {
        throw "Output outside checkout: $full"
    }
    $ancestor = $full
    while ($ancestor) {
        if (Test-Path -LiteralPath $ancestor) {
            $item = Get-Item -Force -LiteralPath $ancestor
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Redirected output/source: $ancestor"
            }
            if (!$item.PSIsContainer -and $item.LinkType -eq 'HardLink') {
                throw "Hard-linked target/source: $ancestor"
            }
        }
        $ancestor = [IO.Path]::GetDirectoryName($ancestor)
    }
    if ([IO.Directory]::Exists($full)) {
        foreach ($entry in [IO.Directory]::EnumerateFileSystemEntries($full)) {
            $attributes = [IO.File]::GetAttributes($entry)
            if ($attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Redirected recursive target/source: $entry"
            }
            if ($attributes -band [IO.FileAttributes]::Directory) {
                Assert-OneSurveyTree $entry -Output:$Output
            } elseif ((Get-Item -Force -LiteralPath $entry).LinkType -eq 'HardLink') {
                throw "Hard-linked target/source: $entry"
            }
        }
    }
}
