@echo off
echo =======================================================
echo   RootRemoteServer - Automatic APK Build Script
echo =======================================================
echo.
echo Building app-debug.apk via Gradle...
call gradlew.bat assembleDebug

if exist app\build\outputs\apk\debug\app-debug.apk (
    echo.
    echo =======================================================
    echo [SUCCESS] APK built successfully!
    echo Location: app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo To install on your phone:
    echo adb install -r app\build\outputs\apk\debug\app-debug.apk
    echo =======================================================
) else (
    echo.
    echo [ERROR] Build failed. Make sure JDK 17 is installed.
)
pause