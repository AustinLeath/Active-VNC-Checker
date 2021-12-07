#inuse=`lsof -PiTCP | grep ":5900"`; was going to use this, but it was sometimes innacurate
inuse=`netstat -vanp tcp | grep 5900 | grep ESTABLISHED`

if [ -n "$inuse" ]
    then
        echo "in use, exiting...";
        #do not do anything because the computer is currently in use
        exit;
    else
        echo "not in use";
        while [ True ]
        do
            variable="$((`ioreg -c IOHIDSystem | sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q'` / 1000000000))"; #get seconds that user has been idle for
            sleep 1; #wait one second
            if [ "$variable" -gt "30" ]
                then
                    echo "idle time greater than 30 seconds, signing out user and exiting...";
                    #do things like sign out a user after 30 seconds of no vnc connection and 30 seconds of inactivity
                    exit;
            fi
        done
fi


