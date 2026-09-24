@echo off
title Set Cloudflare DNS
rem Double-click to switch this PC to Cloudflare DNS (encrypted, IPv4 + IPv6).

rem Ask for admin rights if we don't have them yet
net session >nul 2>&1
if errorlevel 1 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Switching to Cloudflare DNS, please wait...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$dns = '1.1.1.1','1.0.0.1','2606:4700:4700::1111','2606:4700:4700::1001'; $doh = 'https://cloudflare-dns.com/dns-query';" ^
 "foreach ($ip in $dns) {" ^
 "  Add-DnsClientDohServerAddress -ServerAddress $ip -DohTemplate $doh -ErrorAction SilentlyContinue;" ^
 "  Set-DnsClientDohServerAddress -ServerAddress $ip -DohTemplate $doh -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction SilentlyContinue };" ^
 "Get-NetAdapter -Physical | Where-Object Status -eq Up | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses $dns };" ^
 "Clear-DnsClientCache"

echo.
echo Done! Restart any apps or browsers that were open.
echo If something still doesn't load, restart your PC.
echo.
pause
