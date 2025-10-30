# CrowdStrike Falcon Sensor Deployment Script
# Run this in NinjaOne against Windows endpoints

$InstallerPath = "\\vulcan\c$\Program Files (x86)\Lansweeper\PackageShare\Installers\WindowsSensor.MaverickGyr.exe"
$CID = "438983CDD0EC4D1883DA9DDA41C4C223-05"

# Local temp copy
$LocalPath = "$env:TEMP\WindowsSensor.MaverickGyr.exe"

# Copy installer locally (avoid running across network)
Copy-Item $InstallerPath -Destination $LocalPath -Force

# Install silently
$Arguments = "/install /quiet /norestart CID=$CID"
$Process = Start-Process -FilePath $LocalPath -ArgumentList $Arguments -Wait -PassThru

# Exit code handling
if ($Process.ExitCode -eq 0 -or $Process.ExitCode -eq 1641 -or $Process.ExitCode -eq 3010) {
    Write-Output "CrowdStrike Falcon Sensor installed successfully. ExitCode: $($Process.ExitCode)"
    exit 0
} else {
    Write-Error "CrowdStrike install failed. ExitCode: $($Process.ExitCode)"
    exit 1
}
