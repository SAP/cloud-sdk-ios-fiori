#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2020 SAP SE or an SAP affiliate company and cloud-sdk-ios-fiori contributors
# SPDX-License-Identifier: Apache-2.0

set -eu

# install various git hooks
bash scripts/installGitHooks.sh

# delete any xcode project file as it doesn't work well with Swift package localization (https://developer.apple.com/forums/thread/650278)
rm -f -r ./FioriSwiftUI.xcodeproj

echo "--- You can already start developing while script is finishing up ---"

# skip installation of tools if any argument was passed to script
if [ $# -eq 0 ]; then
	if which brew >/dev/null; then
    	brew bundle
		mint bootstrap --link
  	else
    	echo "warning: Homebrew is not installed, download from https://brew.sh/"
  	fi
else
	echo "warning: skipping installation of SwiftLint, SwiftFormat and Sourcery"
fi

# clone/update snapshot reference images
 if [ -d "./Apps/Examples/cloud-sdk-ios-fiori-snapshot-references" ]
 then
     bash scripts/snapshottesting/removeImages.sh
     bash scripts/snapshottesting/cloneImages.sh
 else
     bash scripts/snapshottesting/cloneImages.sh
 fi
