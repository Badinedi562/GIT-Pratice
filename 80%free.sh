
#!/bin/bash

# === Configuration ===
THRESHOLD=80
TO_EMAIL="your_email@example.com"
SUBJECT="⚠️ High Memory Usage Alert"
HOSTNAME=$(hostname)

# === Get memory usage ===
# This gets used memory % from `free` command
MEM_USED_PERCENT=$(free | awk '/Mem:/ { printf("%.0f"), $3/$2 * 100 }')

echo "[$(date)] Current memory usage: $MEM_USED_PERCENT%"

if [ "$MEM_USED_PERCENT" -gt "$THRESHOLD" ]; then
    MESSAGE="Warning: Memory usage on $HOSTNAME is at ${MEM_USED_PERCENT}%. Threshold is ${THRESHOLD}%.
$(free -h)"
    
    echo "$MESSAGE" | mail -s "$SUBJECT" "$TO_EMAIL"
    echo "[$(date)] Alert email sent to $TO_EMAIL."
fi

