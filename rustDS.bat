@echo off
:loop
  rem Generate a random seed in the range 0-2147483647 using PowerShell
  for /f %%i in ('powershell -Command "Get-Random -Minimum 0 -Maximum 2147483648"') do set SEED=%%i

  RustDedicated.exe -batchmode -nographics ^
  -server.ip IPAddressHere ^
  -server.port 28015 ^
  -rcon.ip IPAddressHere ^
  -rcon.port 28016 ^
  -rcon.password "rcon password here" ^
  -server.maxplayers 75 ^
  -server.hostname "Server Name" ^
  -server.identity "my_server_identity" ^
  -server.level "Procedural Map" ^
  -server.seed %SEED% ^
  -server.worldsize 3000 ^
  -server.saveinterval 300 ^
  -server.globalchat true ^
  -server.description "Description Here" ^
  -server.headerimage "512x256px JPG/PNG headerimage link here" ^
  -server.url "Website Here"

  echo.
  echo Restarting server...
  timeout /t 5
goto loop
