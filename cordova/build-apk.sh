#!/bin/bash

# Flappy Birds Neon APK Build Script
# No watermarks, clean build

echo "========================================"
echo "Building FLYING BIRDS APK"
echo "========================================"

cd "$(dirname "$0")"

# Check if cordova is installed
if ! command -v cordova &> /dev/null; then
    echo "Installing Cordova..."
    npm install -g cordova
fi

echo "Setting up Cordova project..."
cordova platform remove android
cordova platform add android

echo "Building Android APK (Release)..."
cordova build android --release

echo ""
echo "========================================"
echo "BUILD COMPLETE!"
echo "========================================"
echo ""
echo "APK Location:"
echo "platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"
echo ""
echo "To sign the APK for distribution:"
echo "jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore my-release-key.jks app-release-unsigned.apk alias_name"
echo ""
echo "To align the APK:"
echo "zipalign -v 4 app-release-unsigned.apk app-release-signed.apk"
echo ""
