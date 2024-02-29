#include <stdio.h>

// Skeleton Code for maze.c

// Structs

struct playerInfo {
    int xPos;
    int yPos;
};

struct maze {
    char rows[100];
    char cols[100];
};



// Functions

int mazeLoader(char filename[256]) {
    int rowcount, colcount;

    //Check width and height (5 <= x <= 100)
    //Check is rectangle (every row and col has same size)
    //Check contains only 1 of 'S' (and maybe 'E'?)
    //Check for any illegal characters (car other than #, ' ', S, or E)

};

// Main

int main(int argc, char *argv[]) {
    printf("Hello World!");
};


