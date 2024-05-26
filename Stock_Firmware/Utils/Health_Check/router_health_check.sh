#!/bin/bash

# Define minimum uptime in minutes, HTTP site to check, dealy in sec. for restart and command to execute if no internet connection
http_site="http://domain.hu"
minimum_uptime=10
command_if_no_internet="reboot -f"
delay=180

# Get uptime in minutes
upSeconds="$(cat /proc/uptime | grep -o '^[0-9]\+')"
upMins=$((${upSeconds} / 60))

# Perform a HEAD request to the URL and extract the HTTP status code
http_code=$(curl -LI "$http_site" -o /dev/null -w '%{http_code}\n' -s)

# If the HTTP status code is not 200 (OK) AND uptime > 10 min, reboot the router
if [ "$http_code" != "200" ]; then
  if  [ $upMins > $minimum_uptime ]; then
   echo "Rebooting the router in $delay sec.."  
   sleep $delay
   echo "$command_if_no_internet" | bash
  else
   echo "No internet connection but uptime is less than 10 minutes, not rebooting.."
  fi
else
 echo "Internet connection is OK"
fi
