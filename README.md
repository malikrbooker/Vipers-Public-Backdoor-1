<h1 align="center">Rust Malware Concept</h1>
<p align="center">
  <img src="https://img.shields.io/badge/Windows-supported-44CC11"/>
  <a href="https://mit-license.org/"/>
    <img src="https://img.shields.io/badge/License-MIT-44CC11"/>
  </a>
  <img src="https://img.shields.io/github/actions/workflow/status/0xvpr/Rust-Malware-Concept/docker_build.yml?label=Build"/>
</p>
<br>
---
A Concept design of a simple malware executable compiled using rust.  
The payload is calc.exe.

### Table of Contents
- [How it works](#how-it-works)
- [Building It Yourself](#building-it-yourself)

### How it works
#### TL;DR
The file moves itself, renames itself (as backdoor.exe), hides itself, and re-executes itself  
inside of the target's **AppData** folder.

**Detailed explanation**  
The application is a Trojan that moves itself into the users <code>AppData</code> folder and sets its  
attribute to hidden. In my case the payload is <code>calc.exe</code>  
You can set this to whatever you want obviously. 

### Building It Yourself
If you compile this code as is, it IS NOT malicious in any way shape or form.

- WSL2/Ubuntu (Docker)
  ```bash
  make docker-container
  make docker-build
  ```
