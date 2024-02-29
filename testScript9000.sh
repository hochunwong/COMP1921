#!/bin/bash

# assume maze arguments:
# ./maze square.csv < data/inputs/good.in > output.tmp 


echo -e "\n\e[1m\e[36m\t~ maze program test script 9000 ~\n\e[0m"

################################################################################

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

################################################################################

echo -e "\nMaze Checking Tests"

# Too few rows
echo -e -n "Testing too few rows . . . "
./maze data/mazes/invalid/tooFewRows.txt > output.tmp
if grep -q "Error - maze too small";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Too few cols
echo -e -n "Testing too few cols . . . "
./maze data/mazes/invalid/tooFewCols.txt > output.tmp
if grep -q "Error - maze too small";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Too many rows
echo -e -n "Testing too many rows . . . "
./maze data/mazes/invalid/tooManyRows.txt > output.tmp
if grep -q "Error - maze too big";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Too many cols
echo -e -n "Testing too many cols . . . "
./maze data/mazes/invalid/tooManyCols.txt > output.tmp
if grep -q "Error - maze too big";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test rectangle check
echo -e -n "Testing non-rectangular maze . . . "
./maze data/mazes/invalid/notRectangle.txt > output.tmp
if grep -q "Error - Maze not rectangle";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test allowed chars check
echo -e -n "Testing maze with illegals . . . "
./maze data/mazes/invalid/invalChars.txt > output.tmp
if grep -q "Error - Maze contains invalid characters";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test missing Start
echo -e -n "Testing maze missing Start . . . "
./maze data/mazes/invalid/noS.txt > output.tmp
if grep -q "Error - Maze does not have Start Point";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test missing End
echo -e -n "Testing maze missing End . . . "
./maze data/mazes/invalid/noE.txt > output.tmp
if grep -q "Error - Maze does not have End Point";
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

################################################################################

echo -e "Map Display and Player Movement Tests"

# Test Map Print
echo -e -n "Testing map display . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/map.in > output.tmp
if cmp -s data/mazes/valid/wasd-testing/correct-m.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test W
echo -e -n "Testing player movement (W) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/W.in > output.tmp
if cmp -s data/mazes/valid/wasd-testing/correct-w.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test A
echo -e -n "Testing player movement (A) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/A.in > output.tmp
if cmp -s data/mazes/valid/wasd-testing/correct-a.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test S
echo -e -n "Testing player movement (S) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/S.in > output.tmp
if cmp -s data/mazes/valid/wasd-testing/correct-s.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

# Test D
echo -e -n "Testing player movement (D) . . . "
./maze data/mazes/valid/wasd-testing/wasd-tester.txt < data/inputs/WASD/D.in > output.tmp
if cmp -s data/mazes/valid/wasd-testing/correct-d.txt output.tmp;
then
    echo -e "\e[32mPass :)\e[0m"
else
    echo -e "\e[31mFail ;(\e[0m"
fi

################################################################################

rm -f output.tmp
