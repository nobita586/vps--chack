#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
BLUE='\033[1;34m'
BLINK='\033[5m'
NC='\033[0m'

# ASCII Logo (Free Fire Style)
logo() {
echo -e "${RED}${BLINK}"
echo "███████╗██████╗ ███████╗███████╗███████╗ ██████╗███████╗"
echo "██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝"
echo "█████╗  ██████╔╝█████╗  █████╗  █████╗  ██║     █████╗  "
echo "██╔══╝  ██╔═══╝ ██╔══╝  ██╔══╝  ██╔══╝  ██║     ██╔══╝  "
echo "███████╗██║     ███████╗███████╗███████╗╚██████╗███████╗"
echo "╚══════╝╚═╝     ╚══════╝╚══════╝╚══════╝ ╚═════╝╚══════╝"
echo -e "${NC}"
}

# VPS or Docker Detection
vps_type() {
virt=$(systemd-detect-virt)
if [ "$virt" == "none" ]; then
    echo -e "${GREEN} ✅ 𝙔𝙀 𝙍𝙀𝙔𝘼𝙇 𝙑𝙋𝙎 𝙃𝙀  ${NC}"
else
    echo -e "${RED} ❌ 𝙔𝙀 𝙁𝘼𝘾𝙆 𝙑𝙋𝙎 𝙃𝙀  [ ${virt} ] ${NC}"
fi

docker_check=$(if [ -f /.dockerenv ]; then echo "Yes"; else echo "No"; fi)
echo -e "${CYAN}🛳 Docker Detected:${NC} $docker_check"
}

# System Information Section
sys_info() {
echo -e "${YELLOW}💻 System Information:${NC}"
echo -e "🌐 Hostname: $(hostname)"
echo -e "🖥 OS: $(lsb_release -d 2>/dev/null | cut -f2 || echo 'Unknown')"
echo -e "🧩 Kernel: $(uname -r)"
echo -e "⏱ Uptime: $(uptime -p)"
echo -e "⚙ CPU: $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)"
echo -e "🔢 Cores: $(nproc)"
echo -e "💾 RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo -e "🗄 Disk: $(df -h / | awk 'NR==2 {print $2}')"
echo -e "📡 IP Address: $(hostname -I | awk '{print $1}')"
echo -e "🛠 Virtualization: $(systemd-detect-virt)"
echo -e "----------------------------------------------"
}

# Main Execution
clear
logo
vps_type
sys_info
