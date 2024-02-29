#include <stdio.h>
#include <stdbool.h> 

// Skeleton Code for maze.c

// Structs

struct player {
    int xPos;
    int yPos;
};

struct mazeStruct {
    char rows[100];
    char cols[100];
    int startX;
    int startY;
};


// Functions

struct mazeStruct mazeLoader(char filename[256]) {
    int rowcount, colcount;

    //Check if file can be opened, if not print error message and exit 1

    //Check width and height (5 <= x <= 100)
    //Check is rectangle (every row and col has same size)
    //Check contains only 1 of 'S' (and maybe 'E'?)
    //Check for any illegal characters (car other than #, ' ', S, or E)

    //If error, print appropriate error message and exit 1

    struct mazeStruct maze;
    
    //Open FILE filename
    //Read file and save each row and col into maze 

    //If error, print appropriate error message and exit 1

    //Locate start point and save position into struct

    return maze;
};


bool checkIsGameOver(struct player Player1, struct mazeStruct maze) {
    //Look at maze at player's location

    //If the maze tile the player is on is 'E', return true

    //else
    return false;
};


void displayMap(struct player Player1, struct mazeStruct maze) {
    //Print map
    //If player on top of S, print X instead of S
};


struct player movePlayer(struct player Player1, struct mazeStruct maze) {
    char input = "";

    //Grab input from player

    if (input == 'M') {
        displayMap(Player1, maze);
    };

    //Look at tile player wants to move to
    //If wall, print error message and ask for new input
    //If edge of map, print error message and ask for new input
    
    //Update player position
    return Player1;
};



// Main

int main(int argc, char *argv[]) {
    char* filename = argv[1];
    bool gameOver = false;
    struct player Player1;
    struct mazeStruct maze;

    //if arguments passed to main not appropriate, exit 1 and print usage

    //Call init function
    mazeLoader(filename);

    //Run game
    while (!gameOver) {
        //Call functions
        movePlayer(Player1, maze);
        gameOver = checkIsGameOver(Player1, maze);
    };

    //Print congrats message
    exit(0);
};
