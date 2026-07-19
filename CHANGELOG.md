# Changelog

All notable changes to **cordova-plugin-fb-analytics** will be documented in this file.

The versioning scheme adheres to [Semantic Versioning 2.0.0](https://semver.org/), with major.minor.patch format.

---

## [1.3.1] - 2026-07-18

### Changed

- Refactored installation process to mandate explicit Meta configuration variables during plugin initialization via `plugman`.
- Standardized required plugin variables:
  - `FACEBOOKAPPID`: Facebook Application Identifier
  - `FACEBOOKCLIENTTOKEN`: Client token for SDK authentication
  - `FACEBOOKDISPLAYNAME`: Application display name in Meta ecosystem
  - `FACEBOOKURLSCHEME`: Custom URL scheme for deep linking
  - `FACEBOOKPRIVACYPOLICYURL`: Privacy policy endpoint URL
  - `FACEBOOKAUTOLOGAPPEVENTSENABLED`: Auto-logging configuration flag
  - `FACEBOOKADVERTISERIDCOLLECTIONENABLED`: IDFA collection consent flag
- Enhanced README documentation to clarify Cordova plugman variable merging semantics and precedence rules.
- Documented preference-based configuration lifecycle and platform-specific runtime replacement strategies.

### Added

- Installation examples demonstrating explicit `--variable` flag usage for reproducible builds.
- Technical notes clarifying variable injection requirements despite `config.xml` preference declarations.

### Fixed

- Validated compatibility with Cordova plugman variable merging by documenting and testing installation parameters.

## [1.3.0] - 2026-07-18

### Added

- Runtime preference-based configuration system for dynamic FacebookAppID, ClientToken, DisplayName, URLScheme, and PrivacyPolicyURL values.
- Automated `AndroidManifest.xml` template injection leveraging `$FacebookAppID` and `$FacebookClientToken` placeholders.
- Automated `Info.plist` template injection leveraging preference tokens (`$FacebookAppID`, `$FacebookClientToken`, `$FacebookDisplayName`, `$FacebookURLScheme`, `$FacebookPrivacyPolicyURL`).
- Native CocoaPods integration via `<podspec>` element for transitive iOS SDK dependencies: FBSDKCoreKit, FBSDKLoginKit, FBSDKShareKit.

### Changed

- Refactored `plugin.xml` to eliminate legacy `<framework type="pod">` directives in favor of podspec-based dependency management.
- Removed Android build dependency on deprecated `facebook_strings.xml` resource file.
- Refactored iOS configuration to eliminate legacy `<edit-config>` directives in favor of template-based injection.
- Validated compatibility with cordova-ios 7.x+ and cordova-android 15.x+ release lines.
- Enhanced technical documentation and standardized installation procedures.

### Removed

- Deprecated `src/android/facebook_strings.xml` resource artifact.
- Legacy Info.plist edit hooks from parent application `config.xml`.
- Legacy AndroidManifest edit hooks from parent application `config.xml`.
- Redundant Facebook SDK framework declarations.

## [1.2.3] - 2026-07-14

### Changed

- Finalized README.md documentation with comprehensive English technical specifications.
- Added npm lifecycle documentation: installation, update, and removal procedures.
- Structured documentation with sections: Requirements, Usage Notes, Privacy Notice, License.
- Harmonized iOS and Android configuration examples and procedures.

## [1.2.2] - 2026-07-14

### Changed

- Corrected README.md Markdown formatting and section hierarchy.
- Revised JavaScript API examples and standardized event nomenclature.
- Enhanced Conversion Value Mapping reference table with additional metadata.

## [1.2.1] - 2026-07-14

### Changed

- Removed localized non-English content from primary documentation.
- Revised installation procedures and diagnostic troubleshooting guidance.
- Refined technical terminology and narrative clarity throughout documentation.

## [1.2.0] - 2026-07-13

### Added

- Full platform compatibility: cordova-ios 7.1.1, Xcode 17, cordova-android 14.0.1, compileSdkVersion 35.
- Advanced Meta SDK integration with FBSDKCoreKit, FBSDKLoginKit, FBSDKShareKit frameworks.
- Automated `Info.plist` key injection for Meta SDK configuration:
  - FacebookAppID, FacebookClientToken, FacebookDisplayName
  - URL Schemes (fbAPPID format)
  - SKAdNetworkItems (iOS 15+ advertising attribution)
  - LSApplicationQueriesSchemes (inter-app communication whitelist)
  - NSPrivacyPolicyURL (privacy disclosure)
  - AutoLog App Events, AdvertiserIDCollectionEnabled flags
- AppDelegate+MetaEvents Objective-C category implementation:
  - SDK initialization and lifecycle management
  - Deep link routing (modern UIScene-based + legacy UIApplication delegates)
  - SceneDelegate support (iOS 13+)
  - AEM (Aggregated Event Measurement) activation
  - SKAdNetwork ConversionValue tracking
- Type-safe JavaScript bridge API with error callback mechanisms.
- SKAdNetwork ConversionValue API for iOS 14+ conversion tracking.
- Funnel and revenue event helper utilities.
- Enhanced parameter type conversion system (JavaScript ↔ Native):
  - JavaScript to Objective-C NSDictionary serialization
  - JavaScript to Java Bundle serialization
- CHANGELOG.md versioning reference.

### Changed

- Refactored `plugin.xml` to implement declarative Meta configuration via plugman mechanism.
- Standardized Android build.gradle to utilize stable Meta SDK `16.0.1` release.
- Extended Android parameter type support:
  - String, Integer, Long, Double, Boolean primitive types
  - BigDecimal numeric precision preservation
- Enhanced iOS parameter type support for numeric and scalar conversion.
- Improved error handling and exception propagation across platform implementations.
- Restructured plugin architecture for improved modularity and maintainability.

### Fixed

- **Critical Bug Fix**: Corrected Android `sendError()` method returning success status for error conditions.
- Corrected Android fallback compileSdkVersion configuration (set to 35).
- Resolved Android BigDecimal rounding loss in numeric parameter conversion.
- Fixed iOS deep link routing logic for UISceneDelegate-based apps.
- Corrected iOS SKAdNetwork and AEM initialization sequencing.
- Hardened JavaScript API callback mechanism against edge cases.

### Removed

- Eliminated requirement for manual `Info.plist` editing in parent application.
- Removed dependency on AppDelegate.m hook-based configuration modifications.

---

## [1.1.0] - 2026-05-15

### Added

- Initial Meta SDK integration framework.
- Baseline `Info.plist` template injection mechanism.
- Core JavaScript API: `logEvent()` and `logPurchase()` methods.
- Objective-C bridge implementation for iOS platform.
- Foundational `plugin.xml` structure and configuration schema.

---

## [1.0.0] - 2026-05-14

### Added

- Initial public release of cordova-plugin-fb-analytics.
