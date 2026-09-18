#!/bin/bash
set -e
echo "Building RootRemoteServer APK..."
chmod +x gradlew
./gradlew assembleDebug
echo "[SUCCESS] APK created at: app/build/outputs/apk/debug/app-debug.apk"