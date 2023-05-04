#!/bin/bash

# Run a series of tests with different commands, in order to ensure that the
# function works as expected

mkdir tmp

# All files
bash ErrLog.sh -P examples -O tmp/Test_Full.csv

# Job 744* only
bash ErrLog.sh -P examples -O tmp/Test_744.csv -J 744

# Array jobs beginning with [4~
bash ErrLog.sh -P examples -O tmp/Test_Array4.csv -J '\[4'
