TASK SCHEDULER BASH SCRIPT V0.1:
A bash script and crontab for feeding jobs from a website (https://github.com/AndyRLP1996/task-uploader-app) to a multithreaded job process where each thread can handle a Serial queue of multiple jobs being submitted at once. 
Authored By Andrew Parkhurst

Crontab is set to run script every 15 seconds.
Script itself can be run from any directory but the locations where the jobs are uploaded and where they should be moved to are stored as `origindir` and `destdir`. 
The crontab will also need to be changed to match the directory the script is run from
The script is designed to be run on the same machine that the web app is hosted on.
The size of the serial queue for each thread is specified in the variable `queuesize`

FEATURES TO IMPLEMENT:
    -add sql query to drop task from webapp database before moving it
    -modify syntax for jobprocess submission
    -possibly find way to add jobs to non-empty, non-full threads
