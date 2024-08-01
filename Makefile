test_watch:
	bash scripts/setup_spm_tests.sh
	xcodebuild -scheme FioriThemeManagerTests -destination 'platform=watchOS Simulator,name=Apple Watch Series 8 (45mm)' test
test_vision:
	xcodebuild -scheme FioriSwiftUI-Package -destination 'platform=visionOS Simulator,name=Apple Vision Pro' clean build test | xcbeautify
test_ios:
	xcodebuild -scheme FioriSwiftUI-Package -destination 'platform=iOS Simulator,name=iPhone 14 Pro' clean build test | xcbeautify
