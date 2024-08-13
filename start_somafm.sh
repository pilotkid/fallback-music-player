#!/bin/bash

# File containing the list of strings
FILE="/etc/soma-choices.csv"

# Check if the file exists
if [[ ! -f $FILE ]]; then
    FILE="/etc/soma-choices.default.csv"
fi

# Count the number of lines in the file
LINE_COUNT=$(wc -l < "$FILE")

# Generate a random line number
RANDOM_LINE=$((RANDOM % LINE_COUNT + 1))

# Pick the random line from the file
RANDOM_STRING=$(sed -n "${RANDOM_LINE}p" "$FILE")

# Start the command in the background using nohup to avoid hang issues
nohup somafm random > /tmp/somafm.log 2>&1 &

# Save the PID to a file
echo $! > /tmp/somafm.pid

# Optionally, you can include a message to indicate that the process is running
echo "somafm started playing $RANDOM_STRING in the background with PID $(cat /tmp/somafm.pid)"
