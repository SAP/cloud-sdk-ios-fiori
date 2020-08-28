#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2020 SAP SE or an SAP affiliate company and cloud-sdk-ios-fiori contributors
# SPDX-License-Identifier: Apache-2.0

set -eu

# install various git hooks
bash scripts/installGitHooks.sh

# delete any xcode project file as it doesn't work well with Swift package localization (https://developer.apple.com/forums/thread/650278)
rm -f -r ./FioriSwiftUI.xcodeproj

# clone/update snapshot reference images
 if [ -d "./Apps/Examples/cloud-sdk-ios-fiori-snapshot-references" ]
 then
     bash scripts/snapshottesting/removeImages.sh
     bash scripts/snapshottesting/cloneImages.sh
 else
     bash scripts/snapshottesting/cloneImages.sh
 fi
