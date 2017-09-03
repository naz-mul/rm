# rm
Problem: UNIX has no recycle bin. When you remove a file or directory, it is gone and
cannot be restored. This project is to write a remove and restore to provide users with a
recycle bin which can be used to safely delete and restore files.

## Phase 1 - Basic Functionality
Write a script called remove that mimics the rm command - remove shold be able to
accept the name of a file as a command line argument as rm does, but instead of deleting
the file your script should move it to a recycle bin directory called deleted in your home
directory.

1. Script name is remove and stored in $HOME/project
2. The recycle bin should be $HOME/deleted. If the deleted directory does not already
   exist, your script should create it.
3. The file to be deleted should be a command line argument and the script executed
   as follows
   *sh remove fileName*
4. The script should test for the following error conditions and display the same error
   messages as the rm command.
   - File does not exist, display error message if file supplied does not exist
   - No filename provided, display error message if no file provided as an argument
   - Directory name provided, display error message if directory provided instead of file.
5. The filenames in the recycle bin should be in the following format
   fileName_inode
   For example, if a file named f1 with inode 1234 was removed, the file in the recycle
   bin should be named f1_1234
   This gets around the potential problem of deleting 2 files with the same name.
   The recycle bin will only contain files, not directories with files.
6. Create a hidden file called .restore.info in $HOME. Each line of this file should contain
   the name of the file in the recyle bin, followed by a colon, followed by the original full path of the filename. For example, if a file called f1, with an inode of 1234 was removed
   from the /home/trainee1 directory, this file would contain:
   
   >f1_1234:/home/trainee1/f1
   
   If another file named f1, with an inode of 5432, was removed from the /home/trainee1/testing
   directory, then .restore.info would contain:
   
   >f1_1234:/home/trainee1/f1
   >f1_5432:/home/trainee1/testing/f1

7. Test the file being deleted is not remove. If it is display an error message 
   "Attempting to delete - operation aborted" and terminate teh script with an exit status.
   (Tip - copy remove before testing this works).