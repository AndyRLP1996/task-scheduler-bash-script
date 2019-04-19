#task scheduler version 1.0
#takes any programs from website upload (insert github URL) moves them to a new folder 
#then checks if there are any threads available in the job handler and submits them if there are
echo "hello world"
#add line grab pid from process name
#pid= ps -e -T | sed -n '2 p'
pid= ps -e -T | grep "2519" | wc -l #counts the number of lines with the given pid
#pid=10
echo $pid
