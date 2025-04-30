
#!/bin/bash

# List of services to monitor
services=("nginx" "mysql" "redis")

for service in "${services[@]}"
do
    systemctl is-active --quiet "$service"
    if [ $? -ne 0 ]; then
        echo "[$(date)] $service is NOT running. Attempting to restart..."
        systemctl restart "$service"
        
        # Optional: check if restart was successful
        if systemctl is-active --quiet "$service"; then
            echo "[$(date)] $service restarted successfully."
        else
            echo "[$(date)] FAILED to restart $service."
        fi
    else
        echo "[$(date)] $service is running."
    fi
done


