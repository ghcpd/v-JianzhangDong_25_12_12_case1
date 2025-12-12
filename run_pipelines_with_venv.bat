@echo off
REM Helper to run CI/CD pipelines with the venv's scripts directory first
SETLOCAL
SET REPO_DIR=%~dp0
cd /d "%REPO_DIR%"
SET PATH=%REPO_DIR%.venv\Scripts;%%PATH%%
pushd ci
call ci_pipeline.bat
popd
pushd cd
call cd_pipeline.bat
popd
ENDLOCAL
