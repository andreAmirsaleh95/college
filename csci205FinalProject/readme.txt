 _________  _______  _________  ________  ___  ________      
|\___   ___\\  ___ \|\___   ___\\   __  \|\  \|\   ____\     
\|___ \  \_\ \   __/\|___ \  \_\ \  \|\  \ \  \ \  \___|_    
     \ \  \ \ \  \_|/__  \ \  \ \ \   _  _\ \  \ \_____  \   
      \ \  \ \ \  \_|\ \  \ \  \ \ \  \\  \\ \  \|____|\  \  
       \ \__\ \ \_______\  \ \__\ \ \__\\ _\\ \__\____\_\  \ 
        \|__|  \|_______|   \|__|  \|__|\|__|\|__|\_________\
                                                 \|_________|
                                                             	


	Thanks for downloading our game! Lots of love, sweat, tears, urine, blood, and pagan sacrifices went into the making of this program. We hope our efforts were not in vain. 


The root of the project directory will be referred to, in this document, as .../csci205FinalProject/


	In order to use this program, you will have to clone our git repository in the usual way and add it as a project in Netbeans. After you’ve added the project, you must then set up the libraries contained in the lib folder as follows.

	In the Tools menu of Netbeans select Libraries. In Ant Library Manager window that appears, select New Library… in the bottom left corner. Name the library whatever you like but I’ll be referring to it as “lwjgl-2.9.3”. You must then use the Add JAR/Folder… button to add jinput.jar, lwjgl.jar, and lwjgl_util.jar located in in .../csci205FinalProject/lib/lwjgl-2.9.3/jar/
	The last two jar files are slick and slick_utils (located in .../csci205FinalProject/lib/slick/lib/)which must also be added to a library or added to the project properties alone in the following step.

	After prepping the libraries, you must then right click on the project and select Properties. In Libraries, added the libraries you created in the previous step using the Ant Library Manager. If you opted for adding the slick jars on their own without adding them to a library, here is where you would use the Add JAR/Folder button to add them. Be sure your Compile-time Libraries field contains the lwjgl-2.9.3 library we created and the slick jar files either in a library or as bare jar files.
	From here, select the Run category and set your VM Options field to reflect the following:
-Djava.library.path=PATH_TO_PROJECT/csci205FinalProject/lib/lwjgl-2.9.3/native/OPERATING_SYS

On my desktop it looks like -Djava.library.path=C:\Users\dtv96\Documents\NetBeansProjects\csci205FinalProject\lib\lwjgl-2.9.3\native\windows	
(Note the reversed slashes. This is because Microsoft wanted to be different.)
On a mac you would end it with macosx and on linux you would end it with linux. FreeBSD and others are available too, take a look at the natives folder for more info.


After you’ve defined the VM Options, you can run the TetrisMain class file in tetris.main.


