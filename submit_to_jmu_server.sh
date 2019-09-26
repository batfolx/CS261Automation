#!/bin/bash

eID=$2
project_number=$3
echo Attempting to see if directory exists...
if [ -z "$4" ]; then
	
	directory="/cs/home/stu/${eID}/cs261/" 
else
	if [ ${4:(-1)} != "/" ]; then
		directory=$4
		directory+="/"

	else
		directory=$4
	fi
fi




if [ -d $1 ]; then
	echo Directory valid. Attempting to zip project.
	if [ -d ~/zip_files/ ]; then

		if [ -d ~/zip_files/Project$project_number/ ]; then
			rm -rf ~/zip_files/Project$project_number/
		fi

		echo Destination address valid. Zipping project.
		cp -rf $1 ~/zip_files//Project$project_number
		echo Folder copied. Zipping project.
		cd ~/zip_files/ &&  zip -r -q project$project_number.zip Project$project_number/
	        echo Project zipped. Attempting to SSH into JMU Server.	
		mv project$project_number.zip ~/zip_files/
	
		scp ~/zip_files/project1.zip  $eID@stu.cs.jmu.edu:$directory 
		if [ "$?" -eq "0" ]; then
			echo Zip file uploaded to JMU CS Server.
			ssh $eID@stu.cs.jmu.edu "unzip -q -o ${directory}project${project_number}.zip -d ${directory}; rm -rf ${directory}project${project_number}.zip; cd ${directory}/Project${project_number}; make clean; make"
			if [ "$?" -eq "0" ]; then
				echo Unzipped zip file into specified directory, $directory. 
			else
				echo Something went wrong. Check your directory, you entered < $directory >.
				exit 1
			fi
		else
			echo SCP failed. Check your directory path. 
			exit 1
		fi

		


	else 
		echo ~/zip_files/ does not exist. Create a directory with this command: mkdir ~/zip_files

	fi

else
	echo The directory $1 is not valid.
fi

