# Move schemes into place to run Swift Package Manager tests

mkdir -p .swiftpm/xcode/xcshareddata/xcschemes
cp scripts/spm_test_schemes/* .swiftpm/xcode/xcshareddata/xcschemes/
xcodebuild -list
