#!/bin/bash

eID=$2
echo Attempting to see if directory exists...
if [ -z "$3" ]; then
	
	directory="/cs/home/stu/${eID}/cs261/" 
else
	directory=$3
fi

echo this is directory $directory


if [ -d $1 ]; then
	echo Directry valid. Attempting to zip project.
	if [ -d ~/zip_files/ ]; then
		echo Destination address valid. Zipping project.
		cp -rf $1 ~/zip_files//Project0
		echo Folder copied. Zipping project.
		cd ~/zip_files/ &&  zip -r -q project0.zip Project0/
	        echo Project zipped. Attempting to SSH into JMU Server.	
		mv project0.zip ~/zip_files/
	
		scp ~/zip_files/project0.zip  $eID@stu.cs.jmu.edu:$directory 
		if [ "$?" -eq "0" ]; then
			echo Zip file uploaded to JMU CS Server.
			ssh $eID@stu.cs.jmu.edu "unzip -q -o ${directory}project0.zip -d ${directory}; rm -rf ${directory}project0.zip"
			if [ "$?" -eq "0" ]; then
				echo Unzipped zip file into specified directory, $directory. 
			else
				echo Something went wrong. Check your directory. Do you have a \"\\\" at the end of your parameter?
				exit 1
			fi
		else
			echo SCP failed. Check directory.
			exit 1
		fi

		


	else 
		echo ~/zip_files/ does not exist. Create a directory with this command: mkdir ~/zip_files

	fi
fi

