#!/bin/bash

# Define the URL to check
http_site="http://domain.hu"

# Perform a HEAD request to the URL and extract the HTTP status code
http_code=$(curl -LI "$http_site" -o /dev/null -w '%{http_code}\n' -s)

# Output the HTTP status code to the console
echo "$http_code"

# If the HTTP status code is not 200 (OK), reboot the router
if [ "$http_code" != "200" ]; then
  reboot -f
fi
