# iOS
xcodebuild archive \
-scheme TaroterSDK \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/TaroterSDK.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# iOS Simulator
xcodebuild archive \
-scheme TaroterSDK \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/TaroterSDK.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# macOS Catalyst
xcodebuild archive \
-scheme TaroterSDK \
-configuration Release \
-destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath './build/TaroterSDK.framework-catalyst.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# Create xcframework
xcodebuild -create-xcframework \
-framework './build/TaroterSDK.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/TaroterSDK.framework' \
-framework './build/TaroterSDK.framework-iphoneos.xcarchive/Products/Library/Frameworks/TaroterSDK.framework' \
-framework './build/TaroterSDK.framework-catalyst.xcarchive/Products/Library/Frameworks/TaroterSDK.framework' \
-output './build/TaroterSDK.xcframework'
