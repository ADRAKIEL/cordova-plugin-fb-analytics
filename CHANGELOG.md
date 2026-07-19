# Changelog

All notable changes to **cordova-plugin-meta-events** will be documented in this file.

This project follows a simplified semantic versioning model.

---
## [1.3.1] - 2026-07-18

### Changed
- Updated installation process to explicitly require Meta configuration variables during plugin installation.
- Documented required variables: `FACEBOOKAPPID`, `FACEBOOKCLIENTTOKEN`, `FACEBOOKDISPLAYNAME`, `FACEBOOKURLSCHEME`, `FACEBOOKPRIVACYPOLICYURL`, `FACEBOOKAUTOLOGAPPEVENTSENABLED`, `FACEBOOKADVERTISERIDCOLLECTIONENABLED`.
- Improved installation instructions in README to reflect Cordova plugman variable merging behavior.
- Clarified preference-based configuration behavior and runtime replacement strategy for iOS and Android.

### Added
- Added explicit examples for plugin installation using `--variable` flags.
- Added notes explaining why Cordova requires variables even when preferences exist in `config.xml`.

### Fixed
- Ensured compatibility with Cordova variable merging by documenting required installation parameters.

## [1.3.0] - 2026-07-18

### Added
- Dynamic preference-based configuration for FacebookAppID, ClientToken, DisplayName, URLScheme, PrivacyPolicyURL.
- Automatic AndroidManifest injection using `$FacebookAppID` and `$FacebookClientToken`.
- Automatic Info.plist injection using `$FacebookAppID`, `$FacebookClientToken`, `$FacebookDisplayName`, `$FacebookURLScheme`, `$FacebookPrivacyPolicyURL`.
- Added `<podspec>` for iOS SDK injection (FBSDKCoreKit, FBSDKLoginKit, FBSDKShareKit).

### Changed
- Updated plugin.xml to remove legacy `<framework type="pod">` entries.
- Updated Android build to remove dependency on `facebook_strings.xml`.
- Updated iOS configuration to remove legacy `<edit-config>` entries.
- Improved compatibility with cordova-ios 7+ and cordova-android 15.
- Improved documentation and installation instructions.

### Removed
- Removed `src/android/facebook_strings.xml`.
- Removed legacy Info.plist edits from app config.xml.
- Removed legacy AndroidManifest edits from app config.xml.
- Removed duplicated Facebook SDK declarations.

## [1.2.3] - 2026-07-14

### Changed

- Updated README with final English documentation.
- Added npm installation, update, and removal instructions.
- Added Requirements, Usage Notes, Privacy Notice, and License sections.
- Improved consistency across iOS/Android configuration examples.

## [1.2.2] - 2026-07-14

### Changed

- Corrected README formatting and section structure.
- Updated JavaScript examples and event naming.
- Improved Conversion Value Mapping table.

## [1.2.1] - 2026-07-14

### Changed

- Removed remaining non-English text from README.
- Updated installation instructions and troubleshooting notes.
- Minor wording and clarity improvements.

## [1.2.0] - 2026-07-13

### Added

- Full compatibility with cordova-ios 7.1.1 and Xcode 17.
- Full compatibility with cordova-android 14.0.1 and compileSdkVersion 35.
- Advanced Meta SDK integration (FBSDKCoreKit, FBSDKLoginKit, FBSDKShareKit).
- Automatic injection of all required Meta keys into Info.plist:
  - FacebookAppID
  - FacebookClientToken
  - FacebookDisplayName
  - URL Schemes (fbAPPID)
  - SKAdNetworkItems
  - LSApplicationQueriesSchemes
  - NSPrivacyPolicyURL
  - AutoLog App Events
  - AdvertiserIDCollectionEnabled
- Added AppDelegate+MetaEvents category for:
  - SDK initialization
  - Deep link handling (modern + legacy)
  - SceneDelegate support (iOS 13+)
  - AEM activation
  - SKAdNetwork activation
- Added robust JavaScript API with safe callbacks.
- Added SKAdNetwork ConversionValue support (iOS 14+).
- Added funnel tracking helper.
- Added revenue event helper.
- Added improved parameter conversion (JS → NSDictionary / Bundle).
- Added CHANGELOG.md.

### Changed

- Updated plugin.xml to include all Meta configuration automatically.
- Updated Android build.gradle to use stable Meta SDK version `16.0.1`.
- Updated Android parameter conversion to support:
  - String
  - Integer
  - Long
  - Double
  - Boolean
- Updated iOS parameter conversion to support numeric types.
- Improved error handling in both platforms.
- Improved plugin structure for better maintainability.

### Fixed

- Fixed critical Android bug: `sendError()` returned `"Success"`.
- Fixed Android fallback compileSdkVersion (now 35).
- Fixed Android BigDecimal precision loss.
- Fixed iOS deep link handling for SceneDelegate.
- Fixed iOS SKAdNetwork and AEM initialization.
- Fixed JS API robustness (safeCallback).

### Removed

- Removed need for manual Info.plist edits.
- Removed need for AppDelegate.m modification hooks.

---

## [1.1.0] - 2026-05-15

### Added

- Initial Meta SDK integration.
- Basic Info.plist injection.
- Basic JS API (`logEvent`, `logPurchase`).
- Basic iOS bridge.
- Basic plugin.xml structure.

---

## [1.0.0] - 2026-05-14

### Added

- Initial release of the plugin.
