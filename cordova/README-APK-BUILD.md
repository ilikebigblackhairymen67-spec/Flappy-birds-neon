# FLYING BIRDS - APK Build Guide

## Quick Start

### Prerequisites
1. **Node.js & npm** - Download from https://nodejs.org/
2. **Android SDK** - Download Android Studio from https://developer.android.com/studio
3. **Java Development Kit (JDK)** - Version 11 or higher

### Setup Environment Variables (Windows)
```bash
set JAVA_HOME=C:\Program Files\Java\jdk-11
set ANDROID_SDK_ROOT=C:\Users\YourUsername\AppData\Local\Android\Sdk
set PATH=%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%PATH%
```

### Setup Environment Variables (Mac/Linux)
```bash
export JAVA_HOME=/usr/libexec/java_home
export ANDROID_SDK_ROOT=~/Android/Sdk
export PATH=$JAVA_HOME/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
```

## Building the APK

### Step 1: Install Cordova
```bash
npm install -g cordova
```

### Step 2: Create Cordova Project (First Time Only)
```bash
cd cordova
cordova create . com.flappybirds.neon "FLYING BIRDS"
```

### Step 3: Add Android Platform
```bash
cordova platform add android
```

### Step 4: Copy Game Files
Copy your `index.html` to `cordova/www/index.html`

### Step 5: Build APK

**Debug Build (Testing):**
```bash
cordova build android
```
APK location: `platforms/android/app/build/outputs/apk/debug/app-debug.apk`

**Release Build (Distribution):**
```bash
cordova build android --release
```
APK location: `platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk`

## Signing the Release APK

### Generate a Keystore (First Time)
```bash
keytool -genkey -v -keystore flappybirds-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias flappybirds
```

When prompted:
- Password: (create a strong password)
- First and Last Name: Your Name
- Organization: Your Company
- Organizational Unit: Development
- City/Locality: Your City
- State/Province: Your State
- Country Code: US (or your country)

### Sign the APK
```bash
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore flappybirds-key.jks platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk flappybirds
```

### Align the APK (Important for Google Play)
```bash
zipalign -v 4 app-release-unsigned.apk FLYING_BIRDS.apk
```

## Final APK
Your signed, aligned APK is ready to distribute: `FLYING_BIRDS.apk`

## Troubleshooting

### "cordova: command not found"
- Install Node.js globally: `npm install -g cordova`

### Android SDK not found
- Set `ANDROID_SDK_ROOT` environment variable to your Android SDK directory
- Open Android Studio → Tools → SDK Manager to verify installation

### Build fails with gradle error
- Clear gradle cache: `cd platforms/android && ./gradlew clean && cd ../..`
- Rebuild: `cordova build android`

### APK too large
- Minify and optimize assets
- Remove unused dependencies from config.xml

## Distribution

### Google Play Store
1. Create Google Play Developer account
2. Upload signed `FLYING_BIRDS.apk`
3. Set app details, screenshots, and pricing

### Direct Download
- Host `FLYING_BIRDS.apk` on your server
- Users download and install directly

## No Watermarks, Clean Build
This configuration produces:
- ✅ Pure game APK with no watermarks
- ✅ No splash screens or ads
- ✅ Full-screen experience
- ✅ Landscape orientation locked
- ✅ All game features intact

## Additional Notes
- Target API Level: 33+ (recommended)
- Min SDK: 24 (Android 7.0+)
- Architectures: arm64-v8a, armeabi-v7a
