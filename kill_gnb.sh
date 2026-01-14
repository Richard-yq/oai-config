#!/bin/bash

# Kill existing nr-softmodem processes
echo "Checking for existing nr-softmodem processes..."

# Show processes before killing
PROCESSES=$(ps aux | grep nr-softmodem | grep -v grep)
if [ -n "$PROCESSES" ]; then
    echo "Found processes to kill:"
    echo "$PROCESSES"
    echo ""
    
    # Get PIDs
    PIDS=$(pgrep -x nr-softmodem)
    echo "Killing PIDs: $PIDS"
    
    sudo pkill -9 nr-softmodem
    sleep 2
    
    # Verify all processes are killed
    if pgrep -x nr-softmodem > /dev/null; then
        echo "Warning: Some processes still running. Force killing..."
        sudo killall -9 nr-softmodem 2>/dev/null
        sleep 1
    fi
    
    echo "All nr-softmodem processes stopped."
else
    echo "No existing nr-softmodem processes found."
fi