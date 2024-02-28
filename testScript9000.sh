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
echo -e -n "Testing non existing file . . . "
./maze thisFileDoesNOTexist.csv > output.tmp
if grep -q "Error - file not found." output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi


echo -e "\nMaze Checking Tests"

# Test maze dimensions (width)



echo -e "Map Display and Player Movement Tests"

# Test Map Print
echo -e -n "Testing map display . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/map.in > output.tmp
# 2 possibilities - X covers S or X does not cover S
if [grep -Fxvf data/mazes/valid/wasd-testing/wasd-tester.txt output.tmp] || [grep -Fxvf data/mazes/valid/wasd-testing/correct-m-ifcoverS.txt output.tmp];
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test W
echo -e -n "Testing player movement (W) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/W.in > output.tmp
if grep -Fxvf data/mazes/valid/wasd-testing/correct-w.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test A
echo -e -n "Testing player movement (A) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/A.in > output.tmp
if grep -Fxvf data/mazes/valid/wasd-testing/correct-a.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test S
echo -e -n "Testing player movement (S) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/S.in > output.tmp
if grep -Fxvf data/mazes/valid/wasd-testing/correct-s.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test D
echo -e -n "Testing player movement (D) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/D.in > output.tmp
if grep -Fxvf data/mazes/valid/wasd-testing/correct-d.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi
rm -f output.tmp
