:ModCheck 
REM Enter location of Mod List and where your steam workshop files download to (set for default)
Set MOD_LIST=(N:\SteamCMD\Servers\DZ-SA\Modlist.txt)
Set STEAM_WORKSHOP=C:\Program Files (x86)\Steam\steamapps\workshop\content\221100
MODE 75 LINE 75
ECHO %DATE%
ECHO %TIME%
COLOR 0A
GOTO Start
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::TITLE DZ-SA-Chernarusplus::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Start
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::STARTING:VARIABLE:PARAMETER:CHECK:::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO CHECKING VARIABLES TOO USE AGAINST SERVER START!!
@ECHO OFF
REM  Server name  :::
Set  Server_Name=DZ-SA
REM  Server files location  :::
Set  Server_Location="N:\SteamCMD\Servers\DZ-SA"
REM  Exe file  :::
Set  Server_Exe="DZSALModServer.exe"
REM  Profile folder  :::
Set  PROFILE="Chernarusplus"
Set  L0GS_PATH="N:\SteamCMD\Servers\DZ-SA\Chernarusplus\LOGS\%DATE%"
Set  LOGS_FOLDER="%DATE%"
REM  BEC location  :::
Set  BEC_LOCATION="N:\SteamCMD\Servers\BEC"
REM  Server Port  :::
Set  PORT=2302
REM  Server config   :::
Set  Config="serverDZ.cfg"
REM  Logical CPU cores to use (Equal or less than available)  :::
Set  CPU=4
REM  Multithreads used per core from your processor if you have this tech you have 2 Multithread per 1 core of your processor
Set  MULTITHREAD_COUNT=2
REM  maximum Ping Permitted  :::
Set  MaxPing=200
REM  Additonal paramters for your server  :::
Set  Args="-DoLogs -AdminLog -NetLog -FilePatching -FreezeCheck "
REM  ModCheck Parameters :::
REM  Client Mods  :::This::Is::Where::You::Will::be::adding::your::Mods::Into::Your::game::::::::::::::::::::::
Set  Mods="@CF;@Community-Online-Tools;"
REM  Server mods  :::
Set  Servermods=""
REM  :::Updating:::Parameters:::For:::Mods:::::::::::::::::::::::::::::::::::::
Set  MOD_LIST=(N:\Steamcmd\Servers\DZ-SA\Modlist.txt)
Set  STEAM_WORKSHOP=N:\Steamcmd\Servers\steamapps\workshop\content\221100
Set  STEAMCMD_LOCATION=N:\Steamcmd
Set  STEAM_USER=[USERNAME CHANGEME PASSWORD]
Set  STEAMCMD_DEL=5
::______________________________________________________________________________________________________________________________________________
:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::  :: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::
::             DO NOT CHANGE ANYTHING BELOW THIS POINT               ::  ::             DO NOT CHANGE ANYTHING BELOW THIS POINT               ::
::               UNLESS YOU KNOW WHAT YOU ARE DOING                  ::  ::               UNLESS YOU KNOW WHAT YOU ARE DOING                  ::
:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::  :: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::
::       Truly I wouldnt change anything except Whats above here everything should be ready too fire up the second its downloaded as long as  ::                                                                                                                              ::          
::      you dont change any of the main variables you should be good for example Server_Name=DZ-SA-Chernarusplus Dont change the server_Name  ::
::    that part is what will sync up with below this if you change it make sure you change the apporiate places so it works tho i probably    ::
::   wouldnt i spent alot of time going through this too make it what it is and will be editing it too perfect it as time goes on             ::
:: SO ABOVE HERE IF ITS BLUE THAT WILL SYNC BELOW TRY NOT BREAKING IT I DONT WANT A MILLION QUESTIONS ON THIS IF ANY OTHER REASON IT DONT WORK::
:: you can contact me at creativ3lab@outlook.com                                                                                              ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::======================::
::Where::You:::Wanna::Go::
::======================::
:choice
set /P c=If you want to Update your Mods press [N]; If you want to Start your Server Press [Y]?
if /I "%c%" EQU "Y" goto :StartDZ
if /I "%c%" EQU "N" goto :UpdateMods
goto :choice

:StartDZ

echo "Because you typed Y We Are gonna start DZ-SA Sit tight"
pause
goto StartBec
::======================::
::BEC==========lAUNCHING::
::======================::
:startbec
cls
echo Starting Bec.
Timeout 3 > NUL
    PING 127.0.0.1 2 > NUL
)
cls
echo Starting Bec..
Timeout 3 > NUL
    PING 127.0.0.1 2 > NUL
)
cls
Echo Starting Bec...
Timeout 3 > NUL
    PING 127.0.0.1 2 > NUL
)
goto StartSv
::=====================::
::SERVER======LAUNCHING::
::=====================::
ECHO.
ECHO Pre startup complete!
ECHO Starting server at: %DATE%,%TIME%
IF "%LOOPS%" NEQ "0" (
	ECHO Restarts: %LOOPS%
)
:StartSv
Color 05
TITLE %Server_Name% batch
Echo (%time%) %Server_Name% starting.
Timeout 5
cd /d "%BEC_LOCATION%"
start "" "bec.exe" -f
::Time in seconds to wait before..
Timeout 3
::Sets title for terminal (DONT edit)
Title %Server_Name% batch
::DayZServer location (DONT edit)
CD  "%Server_Location%"
ECHO (%TIME%) (%DATE%) %Server_Name% started.
::Launch parameters
START "DayZ Server" /min "%Server_Exe%" /wait%%s -profiles=%PROFILE% -Config=%Config% -BEC=%BEC_LOCATION%  -port=%PORT% -Mod=%Mods% -Servermod=%Servermods% -cpuCount=%CPU% -Ping=%MaxPing% -%Args% "-Mods_To_Load=%Servermods% && %Mods%"
IF "%USE_DZSALModServer.exe%" == "true" (
    Echo Starting Mod Server
        START "%Server_Name%'s" /wait %Server_Exe%
    )
    Echo Initializing server loop, wait %%s seconds to initialize Bec loop..
    TIMEOUT 14400 > NUL
        PING 127.0.0.1 3 > NUL
    )
)
::=====================::
::lOOP=============INIT::
::=====================::
ECHO.
GOTO LOOPING

:: Monitoring Loop
:LOOP
ECHO Server is already running, running monitoring loop
goto LOOPING

:: Restart/Crash Handler
:LOOPING
SET /A LOOPS+=1
TIMEOUT /t 5
TASKLIST /FI "%Server_Exe%" == 2 > NUL | find /I /N "%PORT%" > NUL
IF "%ERRORLEVEL%"=="0" GOTO LOOP
GOTO startbec

:: Generic error catching
:ERROR
COLOR 0C
ECHO ERROR: %ERROR% not set correctly, please check the config
PAUSE
COLOR 0F
GOTO :startbec
:Time in seconds to wait before..
Timeout 10
::=====================::
::Updating=========Mods::
::=====================::
:UpdateMods

echo "Because you typed N We are preparing DayZ To update it's Modlist"
PAUSE
echo Reading in configurations/variables set in this batch and MOD_LIST. Updating Steam Workbench mods...
@ timeout 1 >nul
cd %STEAMCMD_LOCATION%
for /f "tokens=1,2 delims=," %%g in %MOD_LIST% do steamcmd.exe +login %STEAM_USER% +workshop_download_item 221100 "%%g" +quit
cls
echo Steam Workshop files up to date! Syncing Workbench source with server destination...
@ timeout 2 >nul
cls
@ for /f "tokens=1,2 delims=," %%g in %MOD_LIST% do robocopy "%STEAM_WORKSHOP%\%%g" "%DAYZ-SA_SERVER_LOCATION%\%%h" *.* /mir
@ for /f "tokens=1,2 delims=," %%g in %MOD_LIST% do forfiles /p "%DAYZ-SA_SERVER_LOCATION%\%%h" /m *.bikey /s /c "cmd /c copy @path %DAYZ-SA_SERVER_LOCATION%\keys"
cls
echo Sync complete! If sync not completed correctly, verify configuration file.
@ timeout 3 >nul
cls
set "MODS_TO_LOAD="
for /f "tokens=1,2 delims=," %%g in %MOD_LIST% do (
set "MODS_TO_LOAD=!MODS_TO_LOAD!%%h;"
)
set "MODS_TO_LOAD=!MODS_TO_LOAD:~0,-1!"
ECHO Will start DayZ with the following mods: "%-mod=%""%-servermod=%"
@ timeout 3 >nul
pause
GOTO startbec
