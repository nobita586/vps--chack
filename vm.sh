#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

# Function to print with typing effect
type_out() {
    text="$1"
    delay="${2:-0.01}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

# Free Fire ASCII Logo
echo -e "${RED}"
echo "███████╗██████╗ ███████╗███████╗███████╗ ██████╗███████╗"
echo "██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝"
echo "█████╗  ██████╔╝█████╗  █████╗  █████╗  ██║     █████╗  "
echo "██╔══╝  ██╔═══╝ ██╔══╝  ██╔══╝  ██╔══╝  ██║     ██╔══╝  "
echo "███████╗██║     ███████╗███████╗███████╗╚██████╗███████╗"
echo "╚══════╝╚═╝     ╚══════╝╚══════╝╚══════╝ ╚═════╝╚══════╝"
echo -e "${NC}"

echo -e "${YELLOW}➤➤➤ VPS STATUS CHECKER ${NC}"
echo -e "${YELLOW}----------------------------------------------${NC}"

# Loading animation
echo -ne "${CYAN}Detecting VPS type"
for i in {1..5}; do
    echo -n "."
    sleep 0.5
done
echo -e "${NC}"
sleep 0.5

# Detect virtualization
virt=$(systemd-detect-virt)

# VPS type detection
if [ "$virt" == "none" ]; then
    type_out "${GREEN} ✅ 𝙔𝙀 𝙍𝙀𝙔𝘼𝙇 𝙑𝙋𝙎 𝙃𝙀  ${NC}" 0.03
else
    type_out "${RED} ❌ 𝙔𝙀 𝙁𝘼𝘾𝙆 𝙑𝙋𝙎 𝙃𝙀  [ ${virt} ] ${NC}" 0.03
fi

echo -e "${MAGENTA}----------------------------------------------${NC}"

# System Information (Neofetch style with arrows)
echo -e "${YELLOW}➤➤➤ System Information:${NC}"
sleep 0.2
type_out "${CYAN}→ Hostname:${NC} $(hostname)" 0.01
type_out "${CYAN}→ OS:${NC} $(lsb_release -d 2>/dev/null | cut -f2 || echo 'Unknown')" 0.01
type_out "${CYAN}→ Kernel:${NC} $(uname -r)" 0.01
type_out "${CYAN}→ Uptime:${NC} $(uptime -p)" 0.01
type_out "${CYAN}→ CPU:${NC} $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)" 0.01
type_out "${CYAN}→ Cores:${NC} $(nproc)" 0.01
type_out "${CYAN}→ RAM:${NC} $(free -h | awk '/Mem:/ {print $2}')" 0.01
type_out "${CYAN}→ Disk:${NC} $(df -h / | awk 'NR==2 {print $2}')" 0.01
type_out "${CYAN}→ IP Address:${NC} $(hostname -I | awk '{print $1}')" 0.01
type_out "${CYAN}→ Virtualization:${NC} $(systemd-detect-virt)" 0.01
type_out "${CYAN}→ Docker Detected:${NC} $(if [ -f /.dockerenv ]; then echo 'Yes'; else echo 'No'; fi)" 0.01

echo -e "${MAGENTA}----------------------------------------------${NC}"
type_out "${YELLOW}✔ VPS Check Complete!${NC}" 0.05
