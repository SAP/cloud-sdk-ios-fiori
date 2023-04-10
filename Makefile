test_watch:
	bash scripts/setup_spm_tests.sh
	xcodebuild -scheme FioriThemeManagerTests -destination 'platform=watchOS Simulator,name=Apple Watch Series 8 (45mm)' test
test_ios:
	xcodebuild -scheme FioriSwiftUI-Package -destination 'platform=iOS Simulator,name=iPhone 14 Pro' clean build test | xcbeautify
