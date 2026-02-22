param(
  [string]$ProjectName = "bantucart"
)

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  Write-Error "Flutter SDK is not installed or not in PATH."
  exit 1
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$appDir = Split-Path -Parent $scriptDir

Push-Location $appDir
try {
  flutter create --project-name $ProjectName --org za.co.maidport --platforms android,ios .
  Write-Host "Flutter Android/iOS wrapper generated."
}
finally {
  Pop-Location
}

