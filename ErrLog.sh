#!/bin/bash

# Set the default path to be the current directory
filePath=$(pwd)

# Default file save path
outPath="LogFile.csv"

# Flags, such as job number
while getopts P:J:O: flag;
do
    case "${flag}" in
        J) # specified job number of part of file name
            job="${OPTARG}"
            ;;
        P) # where to look
            filePath="$OPTARG"
            ;;

        O) # save the file here
            outPath="$OPTARG"
            ;;
        ?) # error if unknown
            echo "Error"
            exit 1
            ;;
    esac
done

# List of all files (use job flag to trim as required)
allF=$(find "$filePath" -name '*.ER' | grep "$job")

# Create an empty megafile
touch "$outPath"
echo "Path,File,Job,Array,Error" > "$outPath"

# Loop through each one
for FILE in $allF 
do  
    # File contents
    fc=$(cat $FILE)

    # Split path and name
    thisPath=$(dirname "$FILE")
    thisName=$(basename "$FILE")
        
    # If this is an array job, it will have square brackets
    if [[ "$thisName" == *"["* ]]; then
    
        # Now split job number too
        jobID="${thisName%\[*}"
        arrID="${thisName#*\[}"
        arrIE="${arrID%\]*}"
        
    else
        
        # If not an array, then just get the job
        jobID="${thisName%.pbs*}"
        arrIE=""
        
    fi
  
    # Write all information to the file
    echo "\"$thisPath\",\"$thisName\",\"$jobID\",\"$arrIE\",\"$fc\"" >> "$outPath"
  
done

echo "Error log written to "$outPath