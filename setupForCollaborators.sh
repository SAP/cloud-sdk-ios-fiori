#!/usr/bin/env bash

set -eu

# install various git hooks
bash scripts/installGitHooks.sh

# generate xcoce project file
rm -f -r ./FioriSwiftUI.xcodeproj
swift package generate-xcodeproj

# add run script to xocde project file
python scripts/addSwiftLintRunScriptToXcodeProj.py
