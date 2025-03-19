# Define the base directory (Make sure this matches your storage location)
$baseDir = "D:\Screenshots"

# Get the current year, month number, and month name
$year = Get-Date -Format "yyyy"
$monthNumber = [int](Get-Date -Format "MM")  # Ensures only the month number (e.g., 3 instead of "March 18")
$monthName = Get-Date -Format "MMMM"

# Construct the correct folder structure
$yearFolder = "$baseDir\$year"
$monthFolder = "$yearFolder\$monthNumber.$monthName"

# Ensure the year folder exists
if (!(Test-Path $yearFolder)) {
    New-Item -ItemType Directory -Path $yearFolder -Force
}

# Ensure the month folder exists (e.g., "3.March")
if (!(Test-Path $monthFolder)) {
    New-Item -ItemType Directory -Path $monthFolder -Force
}

# Update Greenshot configuration file
$greenshotConfig = "$env:APPDATA\Greenshot\Greenshot.ini"

if (Test-Path $greenshotConfig) {
    # Read the existing Greenshot config
    $configContent = Get-Content $greenshotConfig

    # Update OutputFilePath to match the correct month folder
    $configContent = $configContent -replace '(OutputFilePath=).*', "OutputFilePath=$monthFolder"

    # Write the updated config back
    $configContent | Set-Content -Path $greenshotConfig
}

# Restart Greenshot to apply changes
$greenshotProcess = Get-Process -Name Greenshot -ErrorAction SilentlyContinue
if ($greenshotProcess) {
    Stop-Process -Name Greenshot -Force
    Start-Process "$env:PROGRAMFILES\Greenshot\Greenshot.exe"
}
