# This code goes through dyads/subjects folder, then it:
#	- create a resized-[subject] folder
#   - evaluate the lenght of each of the subject video chunks (ratio)
#   - resize the MP4 to 10sec with the ratio 10s / old duration
#   - save the file in a newly made folder


clear

$PATH_TO_DIR = "/"
cd $PATH_TO_DIR

for dyad in $(ls)
do

	cd ${dyad}

	for subject in $(ls)
	do

		cd ${subject}
		mkdir 'resized-'${subject}

	    # List the MP4, finds original length, compute resizing ratio, and 
	    # write a new (resized) MP4.
	    # NB: we could use "ls -I PATTERN" to ignore the newly made 'resized-'${subject}
	    # folder, but it doesn't seem to work here.

		for file in $(ls)
		do
		    
		    echo $PRE_LEN

		    # Apply the resizing to file and write output
		    ffmpeg -i ${file} -filter:v "setpts=(10.0/$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 ${file}))*PTS" 'resized-'${subject}/"resized-"${file}

		done

		cd ..

	done

	cd ..

done