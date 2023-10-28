#!/bin/bash

# Date & Time
DATE=$(date '+%m-%d-%y')
TIME=$(date '+%H:%M:%S')
UPTIME=$(uptime | awk -F ',' '{print $1$2}' | awk -F 'up' '{print $2}')

# Memory Stats
TOTAL_MEMORY=$(free -m | awk '/Mem:/ {print $2}')
USED_MEMORY=$(free -m | awk '/Mem:/ {print $3}')
FREE_MEMORY=$(echo "{$used_memory_kb / $total_memory_kb} * 100")

# Disk & CPU stats
DISK=$(df -h)
CPU=$(top -n 1 | awk '/%Cpu/ {print $2"(user)", $4"(system)", $8"(idle)"'})  # Use 'top' command)

while true 
do
    clear   
    echo "Sysmon"
    echo "-------"
    echo "$(whoami)|${DATE}|${TIME}"
    echo "Uptime:${UPTIME}"
    echo " "
    echo "CPU Usage:"
    echo "${CPU}"
    echo " "
    echo "Total Memory: ${TOTAL_MEMORY}"
    echo "Used Memory: ${USED_MEMORY}"
    echo ""
    
    #echo changes the output for some reason
    df -h --total
    sleep 5
done

