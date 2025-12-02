<div align="center">

# Termux-Studio
### The Ultimate Android Development Environment for Termux

![Platform](https://img.shields.io/badge/Platform-Termux-green?style=for-the-badge&logo=android)
![Language](https://img.shields.io/badge/Language-Bash-blue?style=for-the-badge&logo=gnu-bash)
![Version](https://img.shields.io/badge/Version-2.0%20Pro-purple?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-orange?style=for-the-badge)

</div>

---

## Overview  
<div align="justify">


**Termux-Studio** This script designed to install all required packages and make your Termux into a Android App Development Station.  

</div>  

## Features
*   **Full SDK Support:** Automatically installs `openjdk-17`, `gradle`, `aapt`, `apksigner`, `dx`, and more.
*   **Environment Config:** Auto-configures `JAVA_HOME` and system paths for Gradle stability.

## Included Packages
| Category | Tools |
| :--- | :--- |
| **Core** | `openjdk-17`, `gradle`, `git`, `python` |
| **Build Tools** | `aapt`, `apksigner`, `dx`, `ecj` |
| **Utilities** | `vim`, `nano`, `zip`, `unzip`, `termux-api` |

## Installation & Setup

Copy and paste the following commands into your Termux or Linux:

### 1.Installation
```bash
pkg update && pkg upgrade -y
pkg install git -y
```
### 2.Clone 
```bash
git clone https://github.com/MSI-Sirajul/Termux-Studio.git
```
### 3.Path
```bash
cd $HOME/Termux-Studio/
```
### Termux-Run
```bash
./studio_setup
```
### LINUX
```bash
./studio_setup2
```
<div align="center">

**Thanks for using**  

</div>
