# Remove Skype MSI version
$apps = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Skype*" }
foreach ($app in $apps) {
    $app.Uninstall()
}

# Remove Skype UWP version (Microsoft Store)
Get-AppxPackage *skypeapp* | Remove-AppxPackage
