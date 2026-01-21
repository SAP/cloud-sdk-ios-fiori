#!/usr/bin/env bash

# Implementation is from https://github.com/SonarSource/sonar-scanning-examples/blob/master/swift-coverage/swift-coverage-example/xccov-to-sonarqube-generic.sh
# Project-specific modifications added

set -euo pipefail

function xccov_to_generic {
  echo '<coverage version="1">'

  for xccovarchive_file in "$@"; do
    local xccov_options=""
    if [[ $xccovarchive_file == *".xcresult"* ]]; then
      xccov_options="--archive"
    fi

    # 1. Get the full line-by-line report once
    # 2. Use awk to parse the text and format the XML
    xcrun xccov view $xccov_options "$xccovarchive_file" | awk '
    BEGIN { 
        # Path to remove - adjust as needed
        prefix = "cloud-sdk-ios-fiori/cloud-sdk-ios-fiori/" 
    }
    
    # Identify a new file block
    /^\// { 
        if (in_file) print "  </file>";
        
        file_path = $0
        # Remove trailing colon if present
        sub(/:$/, "", file_path)
        
        # Apply your path modification
        if (index(file_path, prefix) > 0) {
            split(file_path, parts, prefix)
            file_path = parts[2]
        }
        
        # Escape special characters
        gsub("<", "<lt;", file_path)
        gsub(">", ">gt;", file_path)
        
        print "  <file path=\"" file_path "\">"
        in_file = 1
        next
    }
    
    # Identify coverage lines (e.g., "  10: 1", "  11: 0")
    /^[ ]*[0-9]+: [0-9]+/ {
        # Extract line number (strip leading spaces and colon)
        match($0, /[0-9]+/)
        lineNum = substr($0, RSTART, RLENGTH)
        
        # Extract execution count
        split($0, arr, ": ")
        count = arr[2]
        
        covered = (count > 0) ? "true" : "false"
        print "    <lineToCover lineNumber=\"" lineNum "\" covered=\"" covered "\"/>"
    }
    
    END { if (in_file) print "  </file>"; }
    '
  done

  echo '</coverage>'
}

xccov_to_generic "$@"
