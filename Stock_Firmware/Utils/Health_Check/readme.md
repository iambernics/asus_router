## 🚀 Router Automatic Reboot
### 🛠️ A workaround to automatically reboot the router if it is unable to connect to the public internet.

## Table of Contents
1. [Enable SSH Interface on the Router](#1-enable-ssh-interface-on-the-router)
2. [Install WinSCP & Upload `router_health_check.sh`](#2-install-winscp--upload-router_health_checksh)
3. [Install PuTTY for Windows](#3-install-putty-for-windows)
4. [Set Execution Environment](#4-set-execution-environment)
5. [Resources](#resources)

### 🔐 1. Enable SSH Interface on the Router
- **Login to the web page of the router.**
- **Navigate to:** `Administration > System > Enable SSH: Lan Only`.

   For more details, check this video:  
   [Enable SSH Interface on the Router](https://www.youtube.com/watch?v=s7Vqz3g5GXo)
 
### 💻 2. Install WinSCP & Upload `router_health_check.sh`
- **Install WinSCP:**  
   [WinSCP Download](https://winscp.net/eng/download.php)
- **Upload [router_health_check.sh](router_health_check.sh) to the router.** 

### 🖥️ 3. Install PuTTY for Windows  
   [PuTTY Download](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

### 🔧 4. Set Execution Environment
- **Login to the router with PuTTY.**
- **Set RWX permissions to Owner and Group:**  
   ```bash
   chmod 770 /root/router_health_check.sh  

- **Create a cron job to execute on five minute basis.**
   ```bash
   cru a router_health_check */5 * * * * /root/router_health_check.sh

- List existing cron jobs:
   ```bash
   cru l

- Delete Cron job:
   ```bash
   cru d router_health_check

### 📚 Resources
[Crontab Calculator](https://crontab.cronhub.io/)