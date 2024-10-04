#!/usr/bin/env bash

# Implementation is from https://github.com/SonarSource/sonar-scanning-examples/blob/master/swift-coverage/swift-coverage-example/xccov-to-sonarqube-generic.sh
# Project-specific modifications added

set -euo pipefail

function convert_file {
  local xccovarchive_file="$1"
  local file_name="$2"
  local xccov_options="$3"

  # Modification: escape special characters if present in file name, e.g Array<CGPoint>+Extensions.swift to Array&lt;CGPoint&gt;+Extensions.swift
  local file_name_escaped="$2"
  file_name_escaped=${file_name_escaped//</&lt;}
  file_name_escaped=${file_name_escaped//>/&gt;}

  # Modification: remove prefix caused by GitHub action
  file_name_escaped=${file_name_escaped#*cloud-sdk-ios-fiori/cloud-sdk-ios-fiori/}

  echo "  <file path=\"$file_name_escaped\">"
  xcrun xccov view $xccov_options --file "$file_name" "$xccovarchive_file" | \
    sed -n '
    s/^ *\([0-9][0-9]*\): 0.*$/    <lineToCover lineNumber="\1" covered="false"\/>/p;
    s/^ *\([0-9][0-9]*\): [1-9].*$/    <lineToCover lineNumber="\1" covered="true"\/>/p
    '
  echo '  </file>'
}

function xccov_to_generic {
  echo '<coverage version="1">'
  for xccovarchive_file in "$@"; do
    local xccov_options=""
    if [[ $xccovarchive_file == *".xcresult"* ]]; then
      xccov_options="--archive"
    fi
    xcrun xccov view $xccov_options --file-list "$xccovarchive_file" | while read -r file_name; do
      convert_file "$xccovarchive_file" "$file_name" "$xccov_options"
    done
  done
  echo '</coverage>'
}

xccov_to_generic "$@"
