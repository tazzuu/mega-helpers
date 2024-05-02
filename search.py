#!/usr/bin/env python3

# USAGE:
# ./search.py mega_emails.txt

import sys

def extract_email_from_line(line):
    # Splitting the line on whitespace and getting the second half
    parts = line.split()
    if len(parts) > 1:
        return parts[1]
    else:
        return None

args = sys.argv[1:]
input_file = args[0]

address = ""
url = ""

with open(input_file, 'r') as fin:
    for line in fin:
        if line.startswith("To:"):
            address = extract_email_from_line(line)
            if address:
                # keep going until we find a URL or another To: line
                next_line = fin.readline()
                while next_line:
                    # its another To: line so break out of the while loop
                    if next_line.startswith('To:'):
                        break
                    # its the URL we wanted so grab it and print it then break out of the loop
                    elif next_line.startswith('https://mega.nz/#confirm'):
                        url = next_line.strip()
                        print("{}\t{}".format(address, url))
                        break
                    # it was neither a To: line or URL so keep looking ahead
                    next_line = fin.readline()
            else:
                # skip to the next line
                continue

