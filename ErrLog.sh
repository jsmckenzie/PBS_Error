#!/bin/bash

# Flags, such as job number
while getopts J: flag
do
    case "${flag}" in
        J) job=${OPTARG};;
    esac
done

#echo $job

# List of all files (use job flag to trim as required)
#allF=$(find /Users/jmckenzi/Dropbox/ICL/BashTest -name '*.ER')
allF=$(find /Users/jmckenzi/Dropbox/ICL/BashTest -name '*.ER' | grep "$job")

# Create an empty megafile
touch LogFile.csv
echo "File,Error" > LogFile.csv

# Loop through each one
for FILE in $allF
  
  #do cat $FILE;
  #do


  # File contents
  do fc=$(cat $FILE)

  # Write file name to file
  echo "\"$FILE\",\"$fc\"" >> LogFile.csv
  
done


#cat LogFile.csv