@echo off
rem pipsys v1 wrapper: keeps R temporary files on E: under <repo>\.tmp\pipsys,
rem then runs pipsys.R without the user .Rprofile. Usage: see pipsys.R.
setlocal
if /i not "%~d0"=="E:" (
  echo pipsys: this checkout is on %~d0; pipsys writes only on E:. 1>&2
  exit /b 1
)
set "PIPSYS_TMP=%~dp0..\..\.tmp\pipsys"
if not exist "%PIPSYS_TMP%\" mkdir "%PIPSYS_TMP%"
if not exist "%PIPSYS_TMP%\" (
  echo pipsys: cannot create %PIPSYS_TMP%; stopping so R does not use a temp folder on C:. 1>&2
  exit /b 1
)
set "TEMP=%PIPSYS_TMP%"
set "TMP=%PIPSYS_TMP%"
set "TMPDIR=%PIPSYS_TMP%"
Rscript --no-init-file "%~dp0pipsys.R" %*
exit /b %ERRORLEVEL%
