#/bin/bash

RESULT="`wget -qO- http://localhost:8090`"
wget -q localhost:8090
if [$? -eq 0] then
    echo 'OK - Service deployed'
elif [[ $RESULT == *"Number"* ]] then 
    echo 'OK - Number of visits'
    echo $RESULT
else
    echo 'ERROR - Number of visits'
    exit 1