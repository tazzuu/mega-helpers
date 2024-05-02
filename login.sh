#!/bin/bash
set -eu

LOGINSFILE="logins.txt"

grep -v '#' "${LOGINSFILE}" | while IFS=":" read -r username password; do
if [ -n "${username}" ]; then
echo ">>> logging in to account: $username"
megatools ls -u $username -p $password 1>/dev/null || echo "ERROR: couldnt log in to $username" && echo "successful login"
fi
done