#!/usr/bin/env bash

set -eu

# install git pre-commit hook
rm -f .git/hooks/pre-commit
ln -s ../../scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# generate xcoce project file
rm -f -r ./FioriSwiftUI.xcodeproj
swift package generate-xcodeproj

# add run script to xocde project file
python scripts/addSwiftLintRunScriptToXcodeProj.py
