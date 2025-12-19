test_watch:
	bash scripts/setup_spm_tests.sh
	xcodebuild -verbose -scheme FioriThemeManagerTests -destination 'platform=watchOS Simulator,name=Apple Watch Series 11 (46mm)' OTHER_SWIFT_FLAGS="-Xfrontend -solver-expression-time-threshold=500 -Xfrontend -warn-long-function-bodies=50" test
test_vision:
	xcodebuild -verbose -scheme FioriSwiftUI-Package -destination 'platform=visionOS Simulator,name=Apple Vision Pro' OTHER_SWIFT_FLAGS="-Xfrontend -solver-expression-time-threshold=500 -Xfrontend -warn-long-function-bodies=50" clean build test | xcbeautify
test_ios:
	xcodebuild -verbose -scheme FioriSwiftUI-Package -destination 'platform=iOS Simulator,name=iPhone 17' OTHER_SWIFT_FLAGS="-Xfrontend -solver-expression-time-threshold=500 -Xfrontend -warn-long-function-bodies=50" clean build test | xcbeautify
