#!/bin/bash
rm -f temp temp1 APIs
grep -r --no-filename --include=\*.swift --exclude-dir=TestCases 'public struct' ../Sources/ |grep -v "//" > temp
grep -r --no-filename --include=\*.swift --exclude-dir=TestCases 'public class' ../Sources/ |grep -v "//" >> temp
grep -r --no-filename --include=\*.swift --exclude-dir=TestCases 'public enum' ../Sources/ |grep -v "//" >> temp
awk '{$1=$2=""; sub(/^  /, ""); print}' temp > temp1
awk '{sub(/<.*$|:.*|{.*$/, "", $0); print}' temp1 | sort  > APIs
rm -f temp temp1
