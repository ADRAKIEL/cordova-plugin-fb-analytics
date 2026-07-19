# 📘 **cordova-plugin-fb-analytics** (v1.3.1)

Plugin for Meta (Facebook) App Events for **Cordova / Ionic**  
Compatible with **iOS + Android**, SKAdNetwork, AEM, funnel tracking, purchases, and variable-based configuration.

## Compatibility

- **cordova-ios**: 7.1.1
- **cordova-android**: 14.0.1
- **Xcode**: 17
- **Android compileSdkVersion**: 35
- **FBSDK iOS**: v13+
- **Facebook Android SDK**: 16.0.1
- **Ionic Angular**: 7+
- **WKWebView**: Required

### Version 1.3.1 Changes

This version removes legacy configuration files and switches fully to installation variable-based configuration. No manual edits required in AndroidManifest or Info.plist when variables are provided.

## 🚀 Features

### **iOS**

- Automatic Meta SDK initialization
- Automatic Info.plist injection based on installation variables
- SKAdNetwork ConversionValue
- AEM (Aggregated Event Measurement)
- Deep link handling (modern + legacy)
- SceneDelegate support (iOS 13+)
- AutoLog App Events
- AdvertiserIDCollectionEnabled

### **Android**

- Automatic Meta SDK initialization
- Stable SDK version (`16.0.1`)
- Safe parameter conversion (String, Number, Boolean)
- Funnel tracking
- Purchase events
- No manual AndroidManifest edits

### **JavaScript API**

- `logEvent`
- `logPurchase`
- `logFunnelStep`
- `setConversionValue`

# Installation

This plugin requires explicit Meta configuration variables during installation.  
Cordova plugman treats certain preference names as required variables when they appear in `config-file` entries.  
For this reason, installation must include all required Meta parameters.

## Install from local source

```bash
cordova plugin add ../dev/cordova-plugin-fb-analytics \
  --variable FACEBOOKAPPID="YOUR_APP_ID" \
  --variable FACEBOOKCLIENTTOKEN="YOUR_CLIENT_TOKEN" \
  --variable FACEBOOKDISPLAYNAME="YOUR_APP_NAME" \
  --variable FACEBOOKURLSCHEME="fbYOUR_APP_ID" \
  --variable FACEBOOKPRIVACYPOLICYURL="YOUR_PRIVACY_POLICY_URL" \
  --variable FACEBOOKAUTOLOGAPPEVENTSENABLED="true" \
  --variable FACEBOOKADVERTISERIDCOLLECTIONENABLED="true"
```

## Install from npm

```bash
cordova plugin add cordova-plugin-fb-analytics \
  --variable FACEBOOKAPPID="YOUR_APP_ID" \
  --variable FACEBOOKCLIENTTOKEN="YOUR_CLIENT_TOKEN" \
  --variable FACEBOOKDISPLAYNAME="YOUR_APP_NAME" \
  --variable FACEBOOKURLSCHEME="fbYOUR_APP_ID" \
  --variable FACEBOOKPRIVACYPOLICYURL="YOUR_PRIVACY_POLICY_URL" \
  --variable FACEBOOKAUTOLOGAPPEVENTSENABLED="true" \
  --variable FACEBOOKADVERTISERIDCOLLECTIONENABLED="true"
```

## Update the plugin

```bash
cordova plugin remove cordova-plugin-fb-analytics
cordova plugin add cordova-plugin-fb-analytics \
  --variable FACEBOOKAPPID="..." \
  --variable FACEBOOKCLIENTTOKEN="..." \
  --variable FACEBOOKDISPLAYNAME="..." \
  --variable FACEBOOKURLSCHEME="..." \
  --variable FACEBOOKPRIVACYPOLICYURL="..." \
  --variable FACEBOOKAUTOLOGAPPEVENTSENABLED="true" \
  --variable FACEBOOKADVERTISERIDCOLLECTIONENABLED="true"
```

## Notes

- These variables are required due to Cordova plugman's variable merging behavior.
- Even if preferences exist in `config.xml`, plugman requires variables when `config-file` entries reference the same keys.
- The plugin replaces placeholders at runtime in both iOS and Android.

# 📋 Requirements

- Cordova 11+
- Ionic Angular 7+ (recommended)
- WKWebView enabled
- iOS 13+ recommended
- Android 8+

# 🧩 iOS Configuration (From Installation Variables)

No manual edits required **when installation variables are provided**.
The plugin injects Meta keys into **Info.plist** based on the variables passed at install time:

| Key                           | Value (from install variable) |
| ----------------------------- | ----------------------------- |
| FacebookAppID                 | `FACEBOOKAPPID`               |
| FacebookClientToken           | `FACEBOOKCLIENTTOKEN`         |
| FacebookDisplayName           | `FACEBOOKDISPLAYNAME`         |
| URL Scheme                    | `FACEBOOKURLSCHEME`           |
| NSPrivacyPolicyURL            | `FACEBOOKPRIVACYPOLICYURL`    |
| AutoLog App Events            | `FACEBOOKAUTOLOGAPPEVENTSENABLED` |
| AdvertiserIDCollectionEnabled | `FACEBOOKADVERTISERIDCOLLECTIONENABLED` |

The plugin also enables automatically:

- AEM
- SKAdNetwork (framework only)
- SceneDelegate
- Deep links
- AppEvents initialization

# ⚠️ Important

- Plugin configuration is **not automatic without variables**.
- You must install (or reinstall) the plugin with all required `--variable` values.
- The plugin then writes those values into `Info.plist` and `AndroidManifest.xml`.

# 🤖 Android Configuration (From Installation Variables)

Injected into AndroidManifest based on installation variables:

| Key                            | Value             |
| ------------------------------ | ----------------- |
| com.facebook.sdk.ApplicationId | YOUR_APP_ID       |
| com.facebook.sdk.ClientToken   | YOUR_CLIENT_TOKEN |

Uses stable SDK:

```gradle
implementation 'com.facebook.android:facebook-android-sdk:16.0.1'
```

Safe parameter conversion supports:

- String
- Integer
- Long
- Double
- Boolean

# 🧪 JavaScript API

Global object:

```javascript
FBAnalytics;
```

### 📌 Log a custom event

```javascript
FBAnalytics.logEvent("quote_started", {
  plan: "Premium",
  origin: "home",
});
```

### 💰 Log a purchase

```javascript
FBAnalytics.logPurchase("1999.0", "MXN", { plan: "Premium", channel: "app" });
```

### 🔀 Log a funnel step

```javascript
FBAnalytics.logFunnelStep("registration_completed", {
  method: "email",
});
```

### 🎯 Update Conversion Value (iOS SKAdNetwork)

```javascript
FBAnalytics.setConversionValue(10);
```

# 📁 Plugin Structure

```
cordova-plugin-fb-analytics/
│
├── plugin.xml
├── package.json
├── README.md
├── CHANGELOG.md
│
├── docs/
│   └── index.html
│
├── www/
│   └── fb-analytics.js
│
└── src/
    ├── ios/
    │   ├── FBAnalytics.h
    │   ├── FBAnalytics.m
    │   ├── AppDelegate+FBAnalytics.h
    │   └── AppDelegate+FBAnalytics.m
    └── android/
        ├── FBAnalytics.java
        └── build.gradle
```

# 🧪 Troubleshooting

### Events do not appear in Meta Events Manager

- Install the app from **Xcode**, not TestFlight.
- Confirm plugin installation:

```bash
cordova plugin list
```

- Ensure Info.plist contains:
  - FacebookAppID
  - FacebookClientToken
  - FacebookDisplayName
  - URL Scheme fbYOUR_APP_ID

- Ensure AppDelegate+MetaEvents exists in:

```
platforms/ios/<APP>/Plugins/cordova-plugin-fb-analytics/
```

- Wait up to **15 minutes** for events to appear.

# 🧩 Notes

- Supports AEM, SKAdNetwork, AutoLog, and ConversionValue out of the box.
- No manual Info.plist edits required.
- No AppDelegate modifications required.
- Works with Cordova and Ionic.
- Includes:
  - FBSDKCoreKit
  - FBSDKLoginKit
  - FBSDKShareKit

### Conversion Value Mapping:

| Conversion Value | Meaning                |
| ---------------- | ---------------------- |
| 1                | App opened             |
| 5                | Registration completed |
| 10               | Onboarding completed   |
| 20               | Purchase completed     |

## Usage Notes

- Events do not fire when the app is installed via TestFlight.
- SKAdNetwork postbacks may take several hours depending on Apple's timing.
- AEM requires correct configuration in Meta Events Manager.

## Privacy Notice for Apps Using This Plugin

Apps that use this plugin must include the following statements in their privacy policy:

- "This app uses Meta App Events for analytics."
- "Refer to Meta's privacy policy for more information."

## Disclaimer

This plugin integrates the official Meta (Facebook) SDK for iOS and Android.
The SDK is subject to Meta's terms and policies. This plugin does not collect,
store, or transmit any data by itself; it only exposes the SDK's native methods
to Cordova/Ionic applications.

## License

This project is licensed under the MIT License.
