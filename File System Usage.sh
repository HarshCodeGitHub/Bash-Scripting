#!/bin/bash

df -Ph | grep -vE '^/Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' |

while read output;

do
        echo "$output"
        used=$(echo "$output" | awk '{ print $1}' | sed s/%//g)
        if [ ${used} > 90 ];
        then
                echo "Disk Usage is $used% currently."
        else
                echo "Disk Space is Under Limit."
fi
done
