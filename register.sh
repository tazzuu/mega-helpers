#!/bin/bash
set -euo pipefail

#
# registers a bunch of new Mega accounts in a loop
#
# USAGE
# ./register.sh myemail 1 3
#

USERNAME="${1}"
STARTNUM="${2}"
STOPNUM="${3}"
NAME="${NAME:-"Bob"}" # your name is now Bob
DOMAIN="${DOMAIN:-"gmail.com"}" # you are using Gmail because I said you should

# save list of created users here
REGFILE="registered_users.txt"

# get password from file
PASSWORDFILE="password.txt"
PASSWORD="$(grep -v '#' "${PASSWORDFILE}" | head -1)"

for i in $(seq "${STARTNUM}" "${STOPNUM}"); do
EMAIL="${USERNAME}+${i}@${DOMAIN}" # email+1@gmail.com
echo ">>> Registering account for user ${EMAIL}"
megatools reg -e "${EMAIL}" -p "${PASSWORD}" -n "${NAME}" --register && \
    echo "success" && \
    echo "${EMAIL}" >> "${REGFILE}" || echo "ERROR: registration failed for some reason"
done