#!/bin/bash

# Compare the output files with the test files

# List all of the file path/names here
test1="tests/Test_Full.csv"
test2="tests/Test_744.csv"
test3="tests/Test_Array4.csv"

cmp1="testResults/Test_Full.csv"
cmp2="testResults/Test_744.csv"
cmp3="testResults/Test_Array4.csv"

# Result counter
res=0

# Show if the files have been created
ls testResults/

# File 1 (full file)
if cmp --silent -- "$test1" "$cmp1"; then
  echo "Test 1 PASS"
  res=$((res+1))
else
  echo "Test 1 FAIL"
fi

# File 2 (744*)
if cmp --silent -- "$test2" "$cmp2"; then
  echo "Test 2 PASS"
  res=$((res+1))
else
  echo "Test 2 FAIL"
fi

# File 1 ([4)
if cmp --silent -- "$test3" "$cmp3"; then
  echo "Test 3 PASS"
  res=$((res+1))
else
  echo "Test 3 FAIL"
fi

# Check if all tests completed successfully
if [ $res -eq 3 ]; then
  echo "Pass"
  exit 0
else
  echo "Fail"
  exit 1
fi
