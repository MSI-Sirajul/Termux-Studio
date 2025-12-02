<div align="center">

# Termux-Studio
### The Ultimate Android Development Environment for Termux

![Platform](https://img.shields.io/badge/Platform-Termux-green?style=for-the-badge&logo=android)
![Language](https://img.shields.io/badge/Language-Bash-blue?style=for-the-badge&logo=gnu-bash)
![Version](https://img.shields.io/badge/Version-2.0%20Pro-purple?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-orange?style=for-the-badge)

</div>

---

## 🚀 Overview
**Termux-Studio** is an advanced automation script designed to transform your Termux terminal into a professional **Android App Development Station**. It silently installs all necessary tools, configures the environment (JDK 17, Gradle), and prepares your system for building APKs directly on your Android device.

## ✨ Features
*   **Zero-Distraction UI:** Clean, colorful, and box-styled terminal interface.
*   **Full SDK Support:** Automatically installs `openjdk-17`, `gradle`, `aapt`, `apksigner`, `dx`, and more.
*   **Silent Installation:** No more junk logs. Installs packages in the background with progress indicators.
*   **Environment Config:** Auto-configures `JAVA_HOME` and system paths for Gradle stability.
*   **Latest Tools:** Ensures you are using the latest repositories and packages.

## 📦 Included Packages
| Category | Tools |
| :--- | :--- |
| **Core** | `openjdk-17`, `gradle`, `git`, `python` |
| **Build Tools** | `aapt`, `apksigner`, `dx`, `ecj` |
| **Utilities** | `vim`, `nano`, `zip`, `unzip`, `termux-api` |

## 🛠️ Installation & Setup

Copy and paste the following commands into your Termux terminal:

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

**Thanks for using**


