#!/bin/bash

# does not need .sh extention

# Delete container if it is running
containers=$(docker ps -a)
echo $containers
FileToFind=$1

echo "LOOKING FOR CONTAINERS WITH NAME $FileToFind"

echo "$(docker ps -q -f name="$FileToFind")"

if [ "$(docker ps -a -q -f name=$FileToFind)" ]; then
    echo "Container exists with the name $FileToFind"

    # Check if the status is exited
    if [ "$(docker ps -aq -f status=exited -f name=$FileToFind)" ]; then
        echo "container with name $FileToFind is exited"
              
     #check if container is running
    elif [ "$(docker ps -aq -f status=running -f name=$FileToFind)" ]; then
        echo "container with  name $FileToFind is running"
        command="docker stop $FileToFind"
        eval $command
        echo "$FileToFind has been stopped"
   else 
        echo "some other state"
    fi 
else 
    echo "Container does NOT exist with name $FileToFind"
    # the container doesn't exist to begin with
    exit   
fi

# The container is now stopped, so remove it
command="docker rm $FileToFind"
eval $command 
echo "$FileToFind has been removed" 


