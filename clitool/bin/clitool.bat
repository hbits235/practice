@echo off
REM clitool.bat - Wrapper script for the CLI tool
REM This script launches the clitool JAR file

setlocal enabledelayedexpansion

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0

REM Construct the path to the JAR file
set JAR_PATH=%SCRIPT_DIR%clitool.jar

REM Check if the JAR file exists
if not exist "!JAR_PATH!" (
    echo Error: clitool.jar not found at !JAR_PATH!
    exit /b 1
)

REM Run the JAR file with arguments
java -jar "!JAR_PATH!" %*
