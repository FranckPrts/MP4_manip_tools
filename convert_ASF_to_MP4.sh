# Convert a batch of ASF files in a directory called "to_convert"
# into MP4 files stored in a folder named "converted". 

clear

for file in $(ls to_convert)
do

	
	echo ${file}
	ffmpeg -i 'to_convert'/${file} 'converted'/${file}.mp4


done
