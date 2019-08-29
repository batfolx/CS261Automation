#!/bin/bash


$directory = $1
CSProject = project0.zip
eID = $2
SCRIPT = "unzip /cs/home/stu/${2}/cs261/project0.zip"
echo Attempting to see if directory exists...


echo $1
echo $2

if [ -d $1 ]; then
	echo Directry valid. Attempting to zip project.
	if [ -d ~/zip_files/ ]; then
		echo Destination address valid. Zipping project.
		cp -rf $1 ~/zip_files//Project0
		echo Folder copied. Zipping project.
		zip -r project0.zip ~/zip_files/Project0
	        echo Project zipped. Attempting to SSH into JMU Server.	
		mv project0.zip ~/zip_files/
		scp ~/zip_files/project0.zip  $2@stu.cs.jmu.edu:/cs/home/stu/${2}/cs261 
		echo Zip file uploaded to JMU CS Server.
		


	else 
		echo ~/zip_files/ does not exist. Create a directory with this command: mkdir ~/zip_files

	fi
fi



