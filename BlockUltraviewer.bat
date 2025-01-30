@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    echo.
    echo Attempting to relaunch with administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo Blocking connections to Ultraviewer...

:: Add rules to Windows Firewall to block all outbound and inbound connections to Ultraviewer
netsh advfirewall firewall add rule name="Block Ultraviewer Outbound" dir=OUT action=BLOCK program="*ultraviewer.exe"
netsh advfirewall firewall add rule name="Block Ultraviewer Inbound" dir=IN action=BLOCK program="*ultraviewer.exe"

:: Edit the hosts file
set hostsPath=C:\Windows\System32\drivers\etc\hosts

:: Add entries to the hosts file
echo 127.0.0.1 ultraviewer.net >> %hostsPath%
echo 127.0.0.1 www.ultraviewer.net >> %hostsPath%

echo Blocking connections to Ultraviewer is complete.
pause
