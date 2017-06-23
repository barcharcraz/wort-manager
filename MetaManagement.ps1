

function Load-WortConfig {
    param(
        [string]$path = "$([System.Environment]::GetFolderPath("ApplicationData"))/worts"
    )
    $WortsConfig = @{}
    Import-LocalizedData -FileName "DefaultConfiguration.psd1" -BindingVariable "WortsConfig" -BaseDirectory "$(Split-Path -Parent $PSCommandPath)"   
    Import-LocalizedData -FileName "config.psd1" -BindingVariable "WortsConfig" -BaseDirectory $path -ErrorAction SilentlyContinue
    $WortsConfig

}

function Get-Wort {
    param(
        [string]$Name = "*"
    )
    $config = Load-WortConfig
    $children = Get-ChildItem "$($config.Base)/worts" | Where-Object {$_  -Is [System.IO.DirectoryInfo]}
    $children | Where-Object { $_.Name -Like "$Name"} 
    
}