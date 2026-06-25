# 🚀 Quick APK Build Guide - FLYING BIRDS

## ⚡ 30-Second Setup

### 1. Install Prerequisites
```bash
npm install -g cordova
```

### 2. Navigate to cordova folder
```bash
cd cordova
```

### 3. Create project (first time only)
```bash
cordova create . com.flappybirds.neon "FLYING BIRDS"
cordova platform add android
```

### 4. Build APK
```bash
cordova build android --release
```

### 5. Find your APK
📦 **Location:** `platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk`

---

## 🔐 Sign for Distribution (Optional but Recommended)

### Generate Key (First Time)
```bash
keytool -genkey -v -keystore my-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias flyingbirds
```

### Sign the APK
```bash
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore my-key.jks platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk flyingbirds
```

### Align (Required for Play Store)
```bash
zipalign -v 4 app-release-unsigned.apk FLYING_BIRDS_FINAL.apk
```

✅ **Done!** Your APK is ready.

---

## 📋 What You Get
✔️ No watermarks  
✔️ Full-screen game  
✔️ Landscape locked  
✔️ Clean, fast APK  
✔️ Ready to share  

---

## 🆘 Troubleshooting

| Issue | Fix |
|-------|-----|
| "cordova not found" | `npm install -g cordova` |
| Android SDK error | Set `ANDROID_SDK_ROOT` env var |
| Build fails | `cd platforms/android && ./gradlew clean && cd ../..` then retry |

---

## 📱 Install on Phone

1. Download `FLYING_BIRDS_FINAL.apk` to your phone
2. Open file manager → tap APK
3. Tap "Install"
4. Play! 🎮

---

**Need help?** Check `cordova/README-APK-BUILD.md`
