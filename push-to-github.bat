@echo off
REM push-to-github.bat - Script to push the practice project to GitHub
REM This script helps you push the CLITool project to GitHub

setlocal enabledelayedexpansion

REM ==============================================================================
REM CONFIGURATION - Edit this section with your GitHub details
REM ==============================================================================

set GITHUB_REPO=https://github.com/YOUR_USERNAME/practice.git
REM Or use SSH:
REM set GITHUB_REPO=git@github.com:YOUR_USERNAME/practice.git

set BRANCH=master

REM ==============================================================================
REM PUSH TO GITHUB
REM ==============================================================================

echo.
echo Pushing CLITool project to GitHub...
echo Repository: %GITHUB_REPO%
echo Branch: %BRANCH%
echo.

REM Check if remote already exists
git remote | findstr /c:"origin" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo OK Remote 'origin' already exists
    for /f "tokens=*" %%i in ('git remote get-url origin') do set CURRENT_URL=%%i
    echo   Current URL: !CURRENT_URL!
    echo.
    echo If you need to change the URL, run:
    echo   git remote set-url origin %GITHUB_REPO%
) else (
    echo Adding remote 'origin'...
    git remote add origin %GITHUB_REPO%
    if %ERRORLEVEL% EQU 0 (
        echo OK Remote added
    ) else (
        echo ERROR Failed to add remote
        exit /b 1
    )
)

echo.
echo Pushing branch '%BRANCH%' to origin...
git push -u origin %BRANCH%

if %ERRORLEVEL% EQU 0 (
    echo.
    echo OK Successfully pushed to GitHub!
    echo.
    echo Your repository is now at:
    echo   %GITHUB_REPO%
) else (
    echo.
    echo ERROR Push failed. Please check:
    echo   1. GitHub repository exists at %GITHUB_REPO%
    echo   2. You have push permissions
    echo   3. You are authenticated with GitHub
    exit /b 1
)

endlocal
