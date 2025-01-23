@echo off
:: Kiểm tra xem script có đang chạy với quyền quản trị hay không
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Đang yêu cầu quyền quản trị...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo Tắt các dịch vụ không cần thiết...

:: Tắt Bluetooth Support Service
sc stop bthserv
sc config bthserv start= disabled

:: Tắt Windows Search
sc stop WSearch
sc config WSearch start= disabled

:: Tắt Superfetch (SysMain)
sc stop SysMain
sc config SysMain start= disabled

:: Tắt Remote Registry
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled

:: Tắt HomeGroup Listener
sc stop HomeGroupListener
sc config HomeGroupListener start= disabled

:: Tắt HomeGroup Provider
sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

:: Tắt Windows Biometric Service
sc stop WbioSrvc
sc config WbioSrvc start= disabled

:: Tắt Digital Rights Management (DRM)
sc stop DRMProtectedMediaPlayback
sc config DRMProtectedMediaPlayback start= disabled

:: Tắt Network List Service
sc stop netprofm
sc config netprofm start= disabled

:: Tắt Windows Time
sc stop w32time
sc config w32time start= disabled

:: Tắt Program Compatibility Assistant Service
sc stop PcaSvc
sc config PcaSvc start= disabled

:: Tắt Touch Keyboard and Handwriting Panel Service
sc stop TabletInputService
sc config TabletInputService start= disabled

:: Tắt Windows Error Reporting Service
sc stop WerSvc
sc config WerSvc start= disabled

:: Tắt Windows Media Player Network Sharing Service
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

:: Tắt Smart Card
sc stop SCardSvr
sc config SCardSvr start= disabled

:: Tắt Offline Files
sc stop CscService
sc config CscService start= disabled

:: Tắt Application Experience
sc stop AeLookupSvc
sc config AeLookupSvc start= disabled

:: Tắt Connected User Experiences and Telemetry
sc stop DiagTrack
sc config DiagTrack start= disabled

:: Tắt IP Helper
sc stop iphlpsvc
sc config iphlpsvc start= disabled

echo Tất cả các dịch vụ không cần thiết đã được tắt.
pause
