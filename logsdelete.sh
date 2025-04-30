#!/bin/bash

# Directory containing the log files
LOG_DIR="/var/log/myapp"

# Number of days to keep
DAYS=10

# Delete files older than $DAYS
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "Logs older than $DAYS days deleted from $LOG_DIR"

