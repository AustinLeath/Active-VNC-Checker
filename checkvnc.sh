#!/bin/bash

function checkvncuse {
  inuse=$(netstat -vanp tcp | grep 5900 | grep ESTABLISHED | awk '{print $5}' | grep 129.120.207);

  if [ -n "$inuse" ];
    then
        #VNC in use. return 1
        return 1;
  else
    #VNC not in use. return 0
    return 0;
  fi
}

while [ True ]
do
    idletime=$((`ioreg -c IOHIDSystem | sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q'` / 1000000000)); #get seconds that user has been idle for
    if checkvncuse "$notinuse"; 
        then
        if [ "$idletime" -gt "30" ]; 
            then
                echo "VNC not in use, idle time greater than 30 seconds, signing out user and exiting...";
                #do things like sign out a user after 30 seconds of no vnc connection and 30 seconds of inactivity
                exit;
        else
            echo "VNC not in use, waiting for idle time to be greater than 30 seconds... idle time: $idletime.";
        fi
    else
        echo "VNC in use, doing nothing.";
    fi
    sleep 1; #wait one second
done
