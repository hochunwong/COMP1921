#!/bin/bash

# assume maze arguments:
# ./maze square.csv < data/inputs/good.in > output.tmp 


echo -e "\n\e[1m\e[36m\t~ maze program test script 9000 ~\n\e[0m"


echo -e "Argument Tests"

# Test no arguments
echo -e -n "Testing no arguments . . . "
./maze > output.tmp
if grep -q "Usage: maze <mazeFile>" output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test 2 arguments
echo -e -n "Testing 2 arguments . . . "
./maze data/mazes/valid/rectangle.csv data/mazes/valid/square.csv > output.tmp
if grep -q "Usage: maze <mazeFile>" output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test bad argument (missing file)
echo -e -n "Testing 2 arguments . . . "
./maze thisFileDoesNOTexist.csv > output.tmp
if grep -q "Error, file not found." output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi


echo -e "\nMaze Checking Tests"

# Test maze dimensions (width)




# DELETE ME LATER

#    echo -n "Testing x - "
#    ./maze > tmp
#    if grep -q "x" tmp;
#    then
#        echo -e "\e[32mPass :)\e[0m"
#    else
#        echo -e "\e[31mFail ;(\e[0m"
#    fi
