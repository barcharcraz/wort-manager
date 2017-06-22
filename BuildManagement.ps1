
function Check-Variables {
    param(
        [scriptblock]$block
    )
    
    New-Module -ScriptBlock {$block} -Name CheckMod | Import-Module
    $test = "test"
    Test-Path variable:global:pkg_ver
    Describe "Variables Exist" {
    It "pkg_name" {Test-Path variable:pkg_name | Should Be True}
    it "pkg_ver" {Test-Path variable:pkg_ver | Should Be True}
    It "download_dir" {Test-Path variable:download_dir | Should Be True}
    It "build_dir" {Test-Path variable:build_dir | Should Be True}
    It "install_dir" {Test-Path variable:install_dir | Should Be True}
    It "Download" {Test-Path variable:download | Should Be True}
    It "url" {Test-Path variable:url | Should Be True}
    It "hash" {Test-Path variable:hash | Should Be True}
    }
    Remove-Module "CheckMod"
}