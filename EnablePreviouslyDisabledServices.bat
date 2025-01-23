@echo off
:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo Enabling previously disabled services...

:: Enable Bluetooth Support Service
sc config bthserv start= auto
sc start bthserv

:: Enable Windows Search
sc config WSearch start= auto
sc start WSearch

:: Enable Superfetch (SysMain)
sc config SysMain start= auto
sc start SysMain

:: Enable Remote Registry
sc config RemoteRegistry start= auto
sc start RemoteRegistry

:: Enable HomeGroup Listener
sc config HomeGroupListener start= auto
sc start HomeGroupListener

:: Enable HomeGroup Provider
sc config HomeGroupProvider start= auto
sc start HomeGroupProvider

:: Enable Windows Biometric Service
sc config WbioSrvc start= auto
sc start WbioSrvc

:: Enable Digital Rights Management (DRM)
sc config DRMProtectedMediaPlayback start= auto
sc start DRMProtectedMediaPlayback

:: Enable Network List Service
sc config netprofm start= auto
sc start netprofm

:: Enable Windows Time
sc config w32time start= auto
sc start w32time

:: Enable Program Compatibility Assistant Service
sc config PcaSvc start= auto
sc start PcaSvc

:: Enable Touch Keyboard and Handwriting Panel Service
sc config TabletInputService start= auto
sc start TabletInputService

:: Enable Windows Error Reporting Service
sc config WerSvc start= auto
sc start WerSvc

:: Enable Windows Media Player Network Sharing Service
sc config WMPNetworkSvc start= auto
sc start WMPNetworkSvc

:: Enable Smart Card
sc config SCardSvr start= auto
sc start SCardSvr

:: Enable Offline Files
sc config CscService start= auto
sc start CscService

:: Enable Application Experience
sc config AeLookupSvc start= auto
sc start AeLookupSvc

:: Enable Connected User Experiences and Telemetry
sc config DiagTrack start= auto
sc start DiagTrack

:: Enable IP Helper
sc config iphlpsvc start= auto
sc start iphlpsvc

echo All previously disabled services have been enabled.
pause
