#!/bin/bash

# Colors & Effects
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
BLUE='\033[1;34m'
BLINK='\033[5m'
NC='\033[0m'

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
echo -e "${RED}${BLINK}"
echo "███████╗██████╗ ███████╗███████╗███████╗ ██████╗███████╗"
echo "██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝"
echo "█████╗  ██████╔╝█████╗  █████╗  █████╗  ██║     █████╗  "
echo "██╔══╝  ██╔═══╝ ██╔══╝  ██╔══╝  ██╔══╝  ██║     ██╔══╝  "
echo "███████╗██║     ███████╗███████╗███████╗╚██████╗███████╗"
echo "╚══════╝╚═╝     ╚══════╝╚══════╝╚══════╝ ╚═════╝╚══════╝"
echo -e "${NC}"

# Header
echo -e "${BLUE}${BLINK}✨ VPS STATUS CHECKER ✨${NC}"
echo -e "${MAGENTA}══════════════════════════════════════════════${NC}"

# Loading animation
echo -ne "${CYAN}🔍 Detecting VPS type"
for i in {1..5}; do
    echo -n "."
    sleep 0.4
done
echo -e "${NC}"
sleep 0.3

# Detect virtualization
virt=$(systemd-detect-virt)
if [ "$virt" == "none" ]; then
    type_out "${GREEN} ✅ 𝙔𝙀 𝙍𝙀𝙔𝘼𝙇 𝙑𝙋𝙎 𝙃𝙀  ${NC}" 0.03
else
    type_out "${RED} ❌ 𝙔𝙀 𝙁𝘼𝘾𝙆 𝙑𝙋𝙎 𝙃𝙀  [ ${virt} ] ${NC}" 0.03
fi

echo -e "${MAGENTA}══════════════════════════════════════════════${NC}"

# System Info
echo -e "${YELLOW}💻 System Information:${NC}"
sleep 0.2
type_out "🌐 Hostname: $(hostname)" 0.01
type_out "🖥 OS: $(lsb_release -d 2>/dev/null | cut -f2 || echo 'Unknown')" 0.01
type_out "🧩 Kernel: $(uname -r)" 0.01
type_out "⏱ Uptime: $(uptime -p)" 0.01
type_out "⚙ CPU: $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)" 0.01
type_out "🔢 Cores: $(nproc)" 0.01
type_out "💾 RAM: $(free -h | awk '/Mem:/ {print $2}')" 0.01
type_out "🗄 Disk: $(df -h / | awk 'NR==2 {print $2}')" 0.01
type_out "📡 IP Address: $(hostname -I | awk '{print $1}')" 0.01
type_out "🛠 Virtualization: $(systemd-detect-virt)" 0.01
type_out "🐳 Docker Detected: $(if [ -f /.dockerenv ]; then echo 'Yes'; else echo 'No'; fi)" 0.01

echo -e "${MAGENTA}══════════════════════════════════════════════${NC}"

# Live CPU & RAM bars
echo -e "${CYAN}📊 Live CPU & RAM Usage:${NC}"
for i in {1..5}; do
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    ram=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2*100}')
    echo -ne "⚡ CPU: ["
    for j in $(seq 1 $cpu); do echo -ne "#"; done
    for j in $(seq $cpu 100); do echo -ne "-"; done
    echo -ne "] $cpu%  "
    echo -ne "💾 RAM: ["
    for j in $(seq 1 $ram); do echo -ne "#"; done
    for j in $(seq $ram 100); do echo -ne "-"; done
    echo -ne "] $ram%\r"
    sleep 1
done
echo

# Network speed check
echo -e "${CYAN}🌐 Network Speed Check:${NC}"
download=$(wget -O /dev/null http://speedtest.tele2.net/1MB.zip 2>&1 | grep -o '[0-9.]* [KM]*B/s' | tail -1)
type_out "⬇ Download Speed: $download" 0.02

echo -e "${MAGENTA}══════════════════════════════════════════════${NC}"
type_out "${GREEN}${BLINK}🎉 VPS Check Complete! Enjoy your day! 🎉${NC}" 0.05
