#task scheduler
#can run from any directory, though origin and destination directories may need 
#to be changed depending on setup
#currently designed to run on same local machine as web server hosting uploads
#takes any programs from website upload and moves them to a new folder 
#then checks if there are any threads available in the job handler and submits until each queue on an empty thread is full
echo "running task scheduler... "
pid=$(pidof -s firefox) #replace with name of actual job process
cd #move to home directory
origindir=coding/test/environment/uploader/public/uploads/task/attachment #directory the uploads are uploaded to
destdir=coding/dropoff #directory the uploads get sent to
queuesize=5 #this can be changed depending on the size of the queues for the threads
maxthreadcount=$(ps -e -T | grep "$pid" | wc -l) 
#echo $maxthreadcount
threadcount=$(top -H -n1 -b -p4243 | cut -c 48-51 | grep " 0.0" | wc -l) #currently have to manually insert pid
echo $threadcount $maxthreadcount
if [[ $threadcount < $maxthreadcount ]]; then #add condition of folder not being empty
    #grab jobs and pipe into handler
    tempmax=$(($threadcount * $queuesize))
    for i in { $threadcount .. $tempmax .. 1} #add condition to only execute if folder not empty
        do
            filenumber=$(ls -1 $origindir | sed -n 1p) #grabs first line
            filename=$(ls -1 $origindir/$filenumber)
            #echo $filename
            mv $origindir/$filenumber/$filename $destdir
            #add code to drop task from database after moving 
            #rmdir $origindir/$filenumber #deletes empty directory once folder moved
            #$origindir/$filename | jobprocess #replace with correct syntax for loading jobs into process
        done
fi
echo "done "