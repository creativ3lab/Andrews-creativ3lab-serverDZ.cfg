@echo off

TITLE DayZ SA Server - Status
COLOR 0A
:: Variables::
::steamcmd.exe path
set steamcmd_Location="E:Servers\steamcmd\steamcmd.exe"
set steamlogin="***********************";
set steampassword="********************";
::DayZServer_64.exe path
set DAYZ-SA_SERVER_LOCATION="E:\Servers\DayZ\"
::Bec.exe path
set BEC_LOCATION="E:\Servers\Dayz\battleye\Bec"
::::::::::::::

echo Agusanz
goto checksv
pause

:checksv
tasklist /FI "IMAGENAME eq DZSALModServer.exe" 2>NUL | find /I /N "DZSALModServer.exe">NUL
if "%ERRORLEVEL%"=="0" goto checkbec
cls
echo Server is not running, taking care of it..
goto killsv

:checkbec
tasklist /FI "IMAGENAME eq Bec.exe" 2>NUL | find /I /N "Bec.exe">NUL
if "%ERRORLEVEL%"=="0" goto loopsv
cls
echo Bec is not running, taking care of it..
goto startbec

:loopsv
FOR /L %%s IN (30,-1,0) DO (
    cls
    echo Server is running. Checking again in %%s seconds..
    timeout 1 >nul
)
goto checksv

:killsv
taskkill /f /im Bec.exe
taskkill /f /im DZSALModServer.exe
goto startsv

:startsv
cls
echo Starting DayZ SA Server.
timeout 1 >nul
cls
echo Starting DayZ SA Server..
timeout 1 >nul
cls
echo Starting DayZ SA Server...
cd "%DAYZ-SA_SERVER_LOCATION%"
start DZSALModServer.exe -scrAllowFileWrite -config=serverDZ.cfg -port=2302 "-profiles=ServerProfiles" -dologs -adminlog -freezecheck -cpuCount=4 "-mod=@CF;@Community-Online-Tools;"
FOR /L %%s IN (45,-1,0) DO (
    cls
    echo Initializing server, wait %%s seconds to initialize Bec..
    timeout 1 >nul
)
goto startbec

:startbec
cls
echo Starting Bec.
timeout 1 >nul
cls
echo Starting Bec..
timeout 1 >nul
cls
echo Starting Bec...
timeout 1 >nul
cd "%BEC_LOCATION%"
start /min Bec.exe -f Config.cfg --dsc
goto checksv