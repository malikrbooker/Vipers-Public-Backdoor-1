# Viper's Public Backdoor v1.1  

An Intermediate level backdoor that utilizes HTTP/TCP sockets, light Caesar cypher encryption &amp; more.  
  
## Overview
<b>This project was built in a Linux environment using the <code>mingw</code> compiler.</b>  
  
The file moves itself, renames itself (as backdoor.exe), and re-executes itself inside of the victim's <code>AppData</code> folder.

## Table of Contents
 - [Demonstration](#demonstration)
 - [What I Learned](#what-i-learned)
 - [How it works](#how-it-works)
 - [Building It Yourself](#building-it-yourself)

### Demonstration
embed YouTube or place gif.

### What I Learned
While cross compiling from Linux to Windows using <code>x86_64-win64-mingw32-gcc</code> isn't very well  
documented, it is certainly doable. Fortunately, <a href="#building-it-yourself">compilation on this project</a> was a breeze.  

### How it works
The application is a Trojan that moves itself into the users <code>AppData</code> folder and sets its  
attribute to hidden. The file then pings a user-defined host server that holds the malicious  
payload and downloads it. In my case this file was the <code>Nishang Invoke-PowershellTcp.ps1</code>  
You can set this to whatever you want obviously. Once the Payload is downloaded, the  
application then attempts to run it with a reverse shell to another user-defined  
listening server (In this case, defaulted to port 8080).  

If successful, the listening receiver will have a Powershell like environment to do  
whatever the receiver pleases with the victim's pc.

### Building It Yourself
If you compile this code as is, it IS NOT malicious in any way shape or form.  
In fact, the program will run for about 5 minutes before aborting. You will  
need to look around the source code to make things work in your own endeavors.  

Things to look into changing include:
 - User-defined hostname that hosts the payload.
 - User-defined hostname that listens for the activation signal.
 - The actual payload that is hosted itself.

The basis of the build command I used with the GCC compiler was:  
<code>g++ ./src/main.c -lws2_32 -o vipers_public_backdoor.exe</code>
