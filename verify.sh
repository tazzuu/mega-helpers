#!/bin/bash
set -euo pipefail

FILE="${FILE:-$1}"

while IFS=" " read -r username url password token; do
if [ -n "${username}" ]; then
echo ">>> veriying account: $username url: $url token: $token"
megatools reg --verify "${token}" "$url" && echo "success" || echo "ERROR: could not verify account"
fi
done < "${FILE}"