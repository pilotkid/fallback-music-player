#!/bin/bash

# Start the command in the background using nohup to avoid hang issues
nohup somafm random > /tmp/somafm.log 2>&1 &

# Save the PID to a file
echo $! > /tmp/somafm.pid

# Optionally, you can include a message to indicate that the process is running
echo "somafm started in the background with PID $(cat /tmp/somafm.pid)"
