@echo off
setlocal

set "URL=https://raw.githubusercontent.com/simonelonatiuk-ai/COMPAGNONE-LIGHT/refs/heads/main/COMPAGNONE_LIGHT.oajs"
set "REPAIR_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/COMPAGNONE-LIGHT/refs/heads/main/COMPAGNONE%%20LIGHT_REPAIRBENCH.oajs"
set "POSITIONS_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/COMPAGNONE-LIGHT/refs/heads/main/COMPAGNONE%%20LIGHT_POSITIONS.oajs"
set "FARM_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/COMPAGNONE-LIGHT/refs/heads/main/COMPAGNONE%%20LIGHT_FARM.oajs"
set "BEEP_URL=https://github.com/simonelonatiuk-ai/COMPAGNONE-LIGHT/raw/refs/heads/main/beep.wav"

set "SCRIPT_DIR=%~dp0"
set "DEST=%SCRIPT_DIR%COMPAGNONE_LIGHT.oajs"
set "BACKUP=%SCRIPT_DIR%COMPAGNONE_LIGHT backup.oajs"
set "REPAIR_DEST=%SCRIPT_DIR%COMPAGNONE LIGHT_REPAIRBENCH.oajs"
set "REPAIR_BACKUP=%SCRIPT_DIR%COMPAGNONE LIGHT_REPAIRBENCH backup.oajs"
set "POSITIONS_DEST=%SCRIPT_DIR%COMPAGNONE LIGHT_POSITIONS.oajs"
set "FARM_DEST=%SCRIPT_DIR%COMPAGNONE LIGHT_FARM.oajs"
set "FARM_BACKUP=%SCRIPT_DIR%COMPAGNONE LIGHT_FARM backup.oajs"
set "BEEP_DEST=%SCRIPT_DIR%beep.wav"

echo.
echo Aggiornamento COMPAGNONE LIGHT...
echo.

:: --- DOWNLOAD CORE ---
echo Aggiornamento COMPAGNONE_LIGHT.oajs...
if exist "%DEST%" copy /Y "%DEST%" "%BACKUP%" >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%DEST%'"
if errorlevel 1 (
    echo ERRORE: download COMPAGNONE_LIGHT.oajs fallito.
) else (
    echo COMPAGNONE_LIGHT.oajs aggiornato.
)

:: --- DOWNLOAD REPAIR ---
echo.
echo Aggiornamento COMPAGNONE LIGHT_REPAIRBENCH.oajs...
if exist "%REPAIR_DEST%" copy /Y "%REPAIR_DEST%" "%REPAIR_BACKUP%" >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%REPAIR_URL%' -OutFile '%REPAIR_DEST%'"
if errorlevel 1 (
    echo ERRORE: download REPAIRBENCH fallito.
) else (
    echo REPAIRBENCH aggiornato.
)

:: --- DOWNLOAD FARM ---
echo.
echo Aggiornamento COMPAGNONE LIGHT_FARM.oajs...
if exist "%FARM_DEST%" copy /Y "%FARM_DEST%" "%FARM_BACKUP%" >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%FARM_URL%' -OutFile '%FARM_DEST%'"
if errorlevel 1 (
    echo ERRORE: download FARM fallito.
) else (
    echo FARM aggiornato.
)

:: --- DOWNLOAD POSITIONS (SOLO SE NON ESISTE) ---
echo.
echo Controllo COMPAGNONE LIGHT_POSITIONS.oajs...
if exist "%POSITIONS_DEST%" (
    echo File POSITIONS gia presente. Salto il download.
) else (
    echo File POSITIONS non trovato. Download in corso...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%POSITIONS_URL%' -OutFile '%POSITIONS_DEST%'"
)

:: --- DOWNLOAD BEEP (SOLO SE NON ESISTE) ---
echo.
echo Controllo beep.wav...
if exist "%BEEP_DEST%" (
    echo File beep.wav gia presente. Salto il download.
) else (
    echo File beep.wav non trovato. Download in corso...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%BEEP_URL%' -OutFile '%BEEP_DEST%'"
    if errorlevel 1 (
        echo ERRORE: download beep.wav fallito.
    ) else (
        echo beep.wav scaricato correttamente.
    )
)

echo.
echo Operazione completata!
echo.
pause
