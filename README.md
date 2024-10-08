<img src="https://upload.wikimedia.org/wikipedia/commons/3/33/Ancient_warded_lock_key_transparent.png" alt="From Wikipedia" width="150" align="right" caption="Text left hanging">

# PBS Error 🚨

[![CI](https://github.com/jsmckenzie/PBS_Error/actions/workflows/CI.yml/badge.svg?event=workflow_dispatch)](https://github.com/jsmckenzie/PBS_Error/actions/workflows/CI.yml)

PBS array jobs create multiple `.ER` files on failure. So rather than opening each individually, this script creates a single CSV from all or some of these files making it easier to see all of the error messages.

* * *

## Input files
The expected file names are typically `<job number>[<array number>].pbs.ER` such as `7442350[1].pbs.ER` or for non-array jobs `7442350.pbs.ER` without the array job. Test cases can be found in the repository's `example` folder.

## Usage
Running the script without input arguments `bash ErrLog.sh` will search for all `*.ER` files in the current directory (and subfolders), and export these to the default file `LogFile.csv` in the current directory.

The script accepts three input flags: `bash ErrLog.sh -P [file path] -O [outfile file] -J [job number]`

| Flag | Name | Examples | Description |
| :-   | :-    | :-      | :-          |
| -P   | Input folder | `-P examples`| The absolute or local path containing the error files. |
| -O   | Output file | `-O Output.csv` | Output file name including .csv extension. |
| -J   | Job number | `-J 744` `-J '\[4'` | Complete or partial match to a part of the file name, with suitably delimited characters. |

### Examples
The following command 
```
bash ErrLog.sh -P examples -O testResults/Test_Array4.csv -J '\[4'
```
will search through the `examples` subfolder for filenames containing the `[4` pattern. All matching files are output to the file named `testResults/Test_Array4.csv`.

## Output
The structure of the output file shows the file name and information, with the final column containing the error text. Where the file is empty (no error!) the entry is left blank.

| Path | File | Job | Array | Error |
| :-   | :-   | :-  | :-    | :-    |
| examples | 7442350[4].pbs.ER | 7442350 | 4 | Error text |
| examples/7465907 | 7465907[44].pbs.ER | 7465907 | 44 |  |
| ... | ... | ... | ... | ...|
| | | | | |
