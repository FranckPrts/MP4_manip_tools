# Print name, then lenght, of each file. 

clear

$PATH_TO_DIR = "/"
cd $PATH_TO_DIR

for file in $(ls)
do

	PRE_LEN=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 ${file})
	echo ${file}
	echo $PRE_LEN

done