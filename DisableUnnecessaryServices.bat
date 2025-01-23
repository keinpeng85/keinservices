@echo off
:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo Disabling unnecessary services...

:: Disable Bluetooth Support Service
sc stop bthserv
sc config bthserv start= disabled

:: Disable Windows Search
sc stop WSearch
sc config WSearch start= disabled

:: Disable Superfetch (SysMain)
sc stop SysMain
sc config SysMain start= disabled

:: Disable Remote Registry
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled

:: Disable HomeGroup Listener
sc stop HomeGroupListener
sc config HomeGroupListener start= disabled

:: Disable HomeGroup Provider
sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

:: Disable Windows Biometric Service
sc stop WbioSrvc
sc config WbioSrvc start= disabled

:: Disable Digital Rights Management (DRM)
sc stop DRMProtectedMediaPlayback
sc config DRMProtectedMediaPlayback start= disabled

:: Disable Network List Service
sc stop netprofm
sc config netprofm start= disabled

:: Disable Windows Time
sc stop w32time
sc config w32time start= disabled

:: Disable Program Compatibility Assistant Service
sc stop PcaSvc
sc config PcaSvc start= disabled

:: Disable Touch Keyboard and Handwriting Panel Service
sc stop TabletInputService
sc config TabletInputService start= disabled

:: Disable Windows Error Reporting Service
sc stop WerSvc
sc config WerSvc start= disabled

:: Disable Windows Media Player Network Sharing Service
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

:: Disable Smart Card
sc stop SCardSvr
sc config SCardSvr start= disabled

:: Disable Offline Files
sc stop CscService
sc config CscService start= disabled

:: Disable Application Experience
sc stop AeLookupSvc
sc config AeLookupSvc start= disabled

:: Disable Connected User Experiences and Telemetry
sc stop DiagTrack
sc config DiagTrack start= disabled

:: Disable IP Helper
sc stop iphlpsvc
sc config iphlpsvc start= disabled

echo All unnecessary services have been disabled.
pause
