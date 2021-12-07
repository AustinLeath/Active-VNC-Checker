inuse=`lsof -PiTCP | grep ":5900"`;

if [ -n "$inuse" ]
    then
        echo "in use";
        #do not do anything because the computer is currently in use
    else
        echo "not in use";
        #do things like sign out current user
fi