# VPS Checker Script - vm.sh

## Overview
`vm.sh` एक interactive Bash script है जो आपके VPS या Docker environment की real-time जानकारी दिखाता है।  
यह Neofetch style information display करता है, और आपके system को Real VPS या Fake VPS के रूप में पहचानता है।  

---

## Features
- ✅ ASCII Free Fire Logo display  
- ✅ Real/Fake VPS detection (`systemd-detect-virt`)  
- ✅ Hostname, OS, Kernel, Uptime  
- ✅ CPU, Cores, RAM, Disk usage  
- ✅ IP Address  
- ✅ Virtualization type  
- ✅ Docker detection  
- ✅ Live CPU & RAM usage bars (auto-refreshing every 2 seconds)  
- ✅ Colorful and interactive terminal display  

---

## Requirements
- Linux / Ubuntu / Debian based system  
- Bash shell  
- `lscpu`, `df`, `free`, `hostname`, `uptime`, `systemd-detect-virt` commands (default on most Linux distros)  

---

## Installation & Usage

1. Download or create the script `vm.sh`:

```bash
git clone https://github.com/nobita586/vps--chack.git
cd vps--chack
chmod +x vmm.sh
 ./vmm.sh

