# bash-t1

****

### :diamond_shape_with_a_dot_inside: <a name="Bash Training">TASK # 1</a>



* <b>Introduction</b>
   -In this README file i have palced all the information regarding my Bash Training Task. 
   
* <b>Section #1</b>  
    -<b>Problem Statement:</b>Write a bash script that downloads and polls openvswitch (OVS) git repository. Link for ovs repo is below    
     https://github.com/openvswitch/ovs
     
    -<b>The script should performs following actions whenever there is a new commit</b>  
       1. 	Keep polling for the git repository to check if there is any new commit.  
       2. 	If there is any new commit, then clone the repository at new commit.  
       3.	  Install OVS.  
       4.	  Verify that installation is successful.  
       
    -<b>Solution:</b>
    
    <b>OVS Installation:</b> i have written the OVS installation steps in **ovs_installation()** function in my script 'bash_task.sh' link to that script is https://github.com/baqirkazmi30/bash-t1  
     
    <b>Polling:</b> In my script 'bash_task.sh' there is code for polling which i am doing at every 30 second whenever there is new commit it will clone the repository to new commit. 
     
    <b>Verification:</b> if installation is successful according to my script 'bash_task.sh' it will print "Build is Successfull with commit id & timestamp" else it will print "Build Failed with Commit id & timestamp."  
    **i have created my git Repository https://github.com/baqirkazmi30/bash-t1 & push my code for section  'bash_task.sh' into my Repository**    
    
    <b>Useful resources:</b>
       *[Steps to install ovs](https://gist.github.com/olegslavkin/af989e7a850eb67fa779)
       *[How to implement Polling ](https://askubuntu.com/questions/957650/bash-script-for-timer)

* <b>Section #2</b>  
    -<b>Problem Statement:</b>Enhance the bash script developed in section 1 to also check creation of OVS rules. Apply 100 rules on OVS and verify that rules are applied. Also push the updates to github repository.  
    
    -<b>Solution:</b> I have modify my bash script for section 1 'bash_task.sh' to apply rules on OVS i have created a funcation ovs_rules() in my script.
      Pushed this updated script to my git repository.      
    
    -Useful resources:
       *[Commands to apply OVS rules](http://docs.openvswitch.org/en/latest/faq/configuration/)
       
* <b>Section #3</b>  
    -<b>Problem Statement:</b> Convert each sub task in section 1 to a function. Branch out your git repository from Milestone 1 and push the updates from section 3 to “new-branch”. 
    
    -<b>Solution:</b> I have Created bash script 'bash_sec3.sh' for this section & in this script i have converted each sub task of section 1 into function. I have added new branch in my git repository "bashsec3" & push bash script to this branch.
    
    -Useful resources:
       *[How can add new branch is git repo?](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)

* <b>Section #4 Challenge Task</b>  
         -<b>Problem Statement:</b> Update the bash script from Section 3 to do following tasks.  
         -Check if the web server is installed on the system or not.  
         -Install and configure web server on the system if it was not installed.    
         -Add/update an HTML page which shows the build status of the latest commit of OVS (i.e. if the build of current OVS commit is successful or not).   
  
    -</b>Solution:</b> I have modify my bash script for section 3 'bash_sec3.sh' & rediect the output of my "build status" function into a text file name "my_status.txt". To print the text of "my_status.txt" on webserver i have added a script 'output.php' in **/var/www/html** directory of my machine.
     After running this script 'output.php' with command **php output.php** i have checked my webserver page by writing "localhost/output.php" in my webserver address bar.       
     
    -<b>KeyPoint:</b> if your machine has webserver configured in it then its ok if it is not configured then you have to install webserver in your machine.
     i have used installed appache webserver in my machine
      
    -Useful resources:
       *[Steps to configure webserver in your machine](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-16-04)



          
