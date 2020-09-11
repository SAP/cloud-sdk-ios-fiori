#!/bin/bash
xcresultFile=$(find /Users/runner/Library/Developer/Xcode/DerivedData/*/Logs/Test/*.xcresult| head -1)
xcparse screenshots $xcresultFile ./SnapshotTestResultImages/
