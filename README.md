This script is supposed to help you move your source code onto the remote JMU Student server. It zips your directory that you specify and SSH's into the eID you give it and it moves into your CS261 folder.

Example:

./submit_to_jmu_server ~/CS261/Project0/ veleacv

where "~/CS261/Project0/" is the directory to your source code and "veleacv" is your eID.

You may have to have this path on the JMU Student server: /cs/home/stu/<eID>/cs261/ for this to place the project properly.

Let me know of any bugs.

I may add functionality for you to input a third parameter which will be to whatever folder you need for this zip file to be moved in.
