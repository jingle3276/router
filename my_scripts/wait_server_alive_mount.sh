#!/bin/sh

# wait 30 minutes util nas server(192.168.2.125) got ping response 
count=60                                    # Maximum number to try.
while [[ $count -ne 0 ]] ; do
    ping -c 1 -W 1 192.168.2.125            # Try once.
    rc=$?
    echo "count=$count"
    if [[ $rc -eq 0 ]] ; then
        count=1                             # If okay, flag to exit loop.
    fi
    count=$((count-1))                      # So we don't go forever.
    sleep 30                                # sleep 30 seconds for each loop iteration
done

if [[ $rc -eq 0 ]] ; then                 # Make final determination.
# Mount remote drive using cifs client 
sh /opt/my_scripts/lib/mount_cifs.sh
echo "successfully mounted cifs drive"

else
echo "Timeout, no action."
fi

