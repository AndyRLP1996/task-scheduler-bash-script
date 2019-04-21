#task scheduler
#takes any programs from website upload (insert github URL) moves them to a new folder 
#then checks if there are any threads available in the job handler and submits them if there are
echo "running task scheduler... \n"
#initialize maximum number of threads
#maxthreadcount=20 #pick some arbitrary number for now

pid=1943 #for testing purposes only
#pid= pidof -s jobprocess

threadcount= ps -e -T | grep "$pid" | wc -l #counts the number of lines with the given pid

echo $threadcount

if [[ threadcount < maxthreadcount ]]; then #add condition of folder not being empty
    #/coding/bash/task-scheduler.sh
    #grab jobs and pipe into handler
    origindir= coding/test/environment/uploader/public/uploads/task/attachment
    destdir= coding/dropoff
    
    cd  #move to home directory
    for i in { $threadcount .. $maxthreadcount .. 1}
        do
            filenumber= ls -1 | sed -n 1p #grabs first line
            filename= ls -1 $origindir/$filenumber/*
            mv $origindir/$filenumber/* $destdir
            #add code to drop task from database after moving 
            rmdir $origindir/$filenumber #deletes empty directory once folder moved
            #add file to feed script to jobprocess here
        done
fi
echo "done \n"