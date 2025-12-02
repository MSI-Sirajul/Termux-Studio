#!/data/data/com.termux/files/usr/bin/bash

# --- Termux Studio Setup Script ---
# --- Designed for Professional Android Development ---

# --- Colors & Aesthetics ---
R='\033[38;5;196m'   # Bright Red
G='\033[38;5;46m'    # Neon Green
Y='\033[38;5;226m'   # Bright Yellow
B='\033[38;5;39m'    # Neon Blue
P='\033[38;5;201m'   # Neon Pink
C='\033[38;5;51m'    # Cyan
W='\033[1;37m'       # Bold White
GR='\033[38;5;240m'  # Grey
RESET='\033[0m'      # Reset

# --- Configuration ---
APP_NAME="Termux-Studio"
VERSION="Pro v2.1"
AUTHOR="MSI-Sirajul"

# List of extensive packages for full development environment
PACKAGES=(
    git wget curl zip unzip tar 
    vim nano tree
    openjdk-17
    gradle 
    aapt apksigner dx ecj 
    termux-api android-tools
    proot build-essential 
    openssl-tool
)

TOTAL_PKG=${#PACKAGES[@]}
EST_SIZE="~1.2 GB"
EST_TIME="10-15 Min"

# --- UI Functions ---

prepare_screen() {
    clear
    tput civis # Hide cursor
}

restore_cursor() {
    tput cnorm # Show cursor
}

draw_border() {
    echo -e "${B}══════════════════════════════════════════════════════${RESET}"
}

draw_banner() {
    echo -e "${P}"
    echo "  _______                                   "
    echo -e " |__   __|  ${B}Github: ${RESET}${G}@MSI-Sirajul${RESET}${P}" 
    echo "    | | ___ _ __ _ __ ___  _   _ __  __     "
    echo "    | |/ _ \ '__| '_ ' _ \| | | |\ \/ /     "
    echo "    | |  __/ |  | | | | | | |_| | >  <      "
    echo "    |_|\___|_|  |_| |_| |_|\__,_|/_/\_\     "
    echo -e "${C}           S  T  U  D  I  O    ${Y}[$VERSION]${RESET}"
    echo -e ""          
}

draw_info_box() {
    echo -e "${GR}┌──────────────────────────────────────────────────┐${RESET}"
    echo -e "${GR}│${W}               SETUP INFORMATION                  ${GR}│${RESET}"
    echo -e "${GR}├──────────────────────────────────────────────────┤${RESET}"
    echo -e "${GR}│${C}  Target Environment : ${W} Android SDK (Latest)      ${GR}│${RESET}"
    echo -e "${GR}│${C}  Build System       : ${W} Gradle & Kotlin/Java      ${GR}│${RESET}"
    echo -e "${GR}│${C}  Total Packages     : ${W} $TOTAL_PKG Packages               ${GR}│${RESET}"
    echo -e "${GR}│${C}  Required Storage   : ${W} $EST_SIZE (Approx)          ${GR}│${RESET}"
    echo -e "${GR}│${C}  Estimated Time     : ${W} $EST_TIME                 ${GR}│${RESET}"
    echo -e "${GR}└──────────────────────────────────────────────────┘${RESET}"
    echo ""
}

# --- Core Logic Functions ---

configure_environment() {
    echo -ne "${B}[..] Configuring Environment Variables (JAVA_HOME)...${RESET}"
    
    # Set JAVA_HOME in bashrc/zshrc to avoid Gradle errors
    SHELL_CFG="$HOME/.bashrc"
    [ -f "$HOME/.zshrc" ] && SHELL_CFG="$HOME/.zshrc"
    
    if ! grep -q "JAVA_HOME" "$SHELL_CFG"; then
        echo "" >> "$SHELL_CFG"
        echo "export JAVA_HOME=/data/data/com.termux/files/usr/lib/jvm/java-17-openjdk" >> "$SHELL_CFG"
        echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> "$SHELL_CFG"
    fi
    
    sleep 1
    echo -ne "\r\033[K"
    echo -e "${G}[✔] Environment Configured Successfully${RESET}"
}

install_pkg() {
    local pkg_name=$1
    echo -ne "${C}[..] Installing package: ${Y}$pkg_name${RESET}..."
    
    # Silent Install
    pkg install "$pkg_name" -y > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo -ne "\r\033[K"
        echo -e "${G}[✔] Installed: ${W}$pkg_name${RESET}"
    else
        echo -ne "\r\033[K"
        echo -e "${R}[✘] Failed to Install: ${W}$pkg_name${RESET}"
    fi
    # Small delay for visual effect
    sleep 0.2
}

# --- Main Execution Flow ---

prepare_screen
draw_banner
draw_border

echo -e "${W}         Welcome to Termux-Studio Installer${RESET}"
echo -e "${GR}     This script prepares a full Android Dev Base${RESET}"
draw_border
echo ""
echo -e "${W}Do you want to setup ${P}Termux-Studio${W}? ${RESET}"
echo -ne "${Y}[ENTER] to Continue, [CTRL+C] to Exit...${RESET}"
read input

prepare_screen
draw_banner
draw_info_box

echo -e "${W}Ready to download and install all dependencies.${RESET}"
echo -ne "${P}Press [ENTER] to Start Installation...${RESET}"
read input

prepare_screen
draw_banner
echo -e "${C}--- SYSTEM UPDATE & INSTALLATION STARTED ---${RESET}\n"

# 1. Update Repositories
echo -ne "${B}[..] Updating Core Repositories (Please wait)...${RESET}"
pkg update -y > /dev/null 2>&1
pkg upgrade -y > /dev/null 2>&1
echo -ne "\r\033[K"
echo -e "${G}[✔] System Repositories Updated${RESET}"

# 2. Configure Repos (Enable root/x11 if needed, silent)
echo -ne "${B}[..] Configuring Extra Repositories...${RESET}"
pkg install root-repo -y > /dev/null 2>&1
pkg install x11-repo -y > /dev/null 2>&1
echo -ne "\r\033[K"
echo -e "${G}[✔] Extra Repositories Added${RESET}"
echo ""

# 3. Install Loop
for pkg in "${PACKAGES[@]}"; do
    install_pkg "$pkg"
done

echo ""
# 4. Environment Setup
configure_environment

# 5. Final Screen
echo ""
draw_border
echo -e "${G}          SETUP COMPLETED SUCCESSFULLY!        ${RESET}"
draw_border
echo -e "${W} All tools (Gradle, JDK 17, AAPT, Signer) are ready.${RESET}"
echo -e "${W} Please restart Termux to apply environment changes.${RESET}"
echo ""
echo -e "${GR} Developed for Termux-Studio${RESET}"

restore_cursor