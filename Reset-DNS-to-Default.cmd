@echo off
title Reset DNS to Default
rem Double-click to reset DNS to automatic (your internet provider's default). Does not restore any custom DNS you had before.

net session >nul 2>&1
if errorlevel 1 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Resetting DNS to default, please wait...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "Get-NetAdapter -Physical | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ResetServerAddresses };" ^
 "Clear-DnsClientCache"

echo.
echo Done! DNS is reset to your internet provider's default.
echo.
pause
