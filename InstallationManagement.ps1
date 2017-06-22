function Clean-All {
    param([string]$base = $(Get-Location))
    Remove-Item -Recurse "$base/install" -Force
    Remove-Item -Recurse "$base/build" -Force
    Remove-Item -Recurse "$base/source" -Force
    Remove-Item -Recurse "$base/download" -Force
    Remove-Item -Recurse "$base/pkgs" -Force
}

#region section Linking commands
function Link-Wort {
    param(
        [string]$pkg,
        [string]$base = $(Get-Location),
        [string]$install_dir = "$base/install"
    )
    New-Item -ItemType Directory "$install_dir" -Force
    Push-Location $(Join-Path "$base/pkgs/" $pkg)
    foreach ($file in $(Get-ChildItem -File -Recurse $(Get-Location))) {
        $relpath = $(Resolve-Path -Relative -Path $file.FullName)
        New-Item -ItemType SymbolicLink -Path $(Join-Path $install_dir $relpath) -Value $file.FullName -Force
    }
    Pop-Location
}

function Unlink-Wort {
    param(
        [string]$pkg,
        [string]$base = $(Get-Location),
        [string]$install_dir = "$base/install"
    )
    Push-Location $(Join-Path "$base/pkgs/" $pkg)
    foreach ($file in $(Get-ChildItem -File -Recurse $(Get-Location))) {
        $relpath = $(Resolve-Path -Relative -Path $file.FullName)
        $linkpath = $(Join-Path $install_dir $relpath)
        $linkitem = $(Get-Item -ErrorAction SilentlyContinue $linkpath)
        if($linkitem -eq $null) {continue}
        if($linkitem.LinkType -eq $null) {
            Write-Warning -Message ("Found non symlink item {0}" -f $linkitem.FullName)
            continue
        }
        if($linkitem.Target -ne $file.FullName) {
            Write-Warning -Message ("Found symlink pointing to another package {0}" -f $linkitem.FullName)
            continue
        }
        Remove-Item $linkitem        
    }
    do {
        $dirs = Get-ChildItem -Directory -Recurse $install_dir |
            Where-Object { (Get-ChildItem $_.FullName).Count -eq 0 } |
            Select-Object -ExpandProperty FullName
        $dirs | ForEach-Object { Remove-Item $_ }
    } while ($dirs.Count -gt 0)
    Pop-Location 
}
#endregion