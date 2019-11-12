This script is supposed to help you move your source code onto the remote JMU Student server. It zips your directory that you specify and SSH's into the eID you give it and it moves into your CS261 folder of your choosing and runs **make test** for you.

The first paramter is the path to your directory where your source code is. 
The second parameter is your eID. 
The third parameter is the project number (for naming the folder on stu). 
The fourth parameter is an optional parameter that will default to ~/**eID**/cs261/. If you do not want your code to go into that directory, you may specify a directory in which your code will go.


Example:

If you wanted to get your local code (located in directory ~/CS261/p4/), using the eID notaneID onto stu for p4 into the directory ~/**eID**/CS261Projects/, this is what it would look like:

  ```
  ./submit_to_jmu_server ~/CS261/p4/ notaneID 4 ~/**eID**/CS261Projects/ 
  ```




Let me know of any bugs.


