#!/bin/bash
xcodebuild -project ./Apps/Examples/Examples.xcodeproj -scheme ExamplesTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone SE (2nd generation)' test
