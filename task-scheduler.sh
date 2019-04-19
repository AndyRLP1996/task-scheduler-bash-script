#task scheduler
#takes any programs from website upload (insert github URL) moves them to a new folder 
#then checks if there are any threads available in the job handler and submits them if there are
echo "hello world"
#initialize maximum number of threads

#maxthreadcount=20 #pick some arbitrary number for now

#add line grab pid from process name

pid=1943 #temporary
#pid= pidof -s handler

threadcount= ps -e -T | grep "$pid" | wc -l #counts the number of lines with the given pid

echo $threadcount

if [[ threadcount < maxthreadcount ]]; then
    #/coding/bash/task-scheduler.sh
    #will need to make changes to run from different directory
    #grab jobs and pipe into handler
    origindir= /coding/test/environment/uploader/public/uploads
    destdir= /coding/dropoff
    
fi
