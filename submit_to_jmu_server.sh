#!/bin/bash


$directory = $1
CSProject = project0.zip
eID = $2
echo Attempting to see if directory exists...

if [ -d $1 ]; then
	echo Directry valid. Attempting to zip project.
	if [ -d ~/zip_files/ ]; then
		echo Destination address valid. Zipping project.
		cp -rf $1 ~/zip_files//Project0
		echo Folder copied. Zipping project.
		cd ~/zip_files/ &&  zip -r project0.zip Project0/
	        echo Project zipped. Attempting to SSH into JMU Server.	
		mv project0.zip ~/zip_files/
		

		scp ~/zip_files/project0.zip  $2@stu.cs.jmu.edu:/cs/home/stu/${2}/cs261/ 
		if [ "$?" -eq "0" ]; then
			echo Zip file uploaded to JMU CS Server.
		else
			echo SCP failed. Check directory.
		fi

		ssh $2@stu.cs.jmu.edu "ls; unzip -o  /cs/home/stu/${2}/cs261/project0.zip -d /cs/home/stu/${2}/cs261/; rm -rf /cs/home/stu/${2}/cs261/project0.zip Project0/"

		


	else 
		echo ~/zip_files/ does not exist. Create a directory with this command: mkdir ~/zip_files

	fi
fi



