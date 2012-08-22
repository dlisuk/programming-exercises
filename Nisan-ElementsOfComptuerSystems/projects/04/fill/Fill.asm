// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Put your code here.

@131072
D=A
@SCREEN
D=D+A
@SCREEN_MAX
M=D

(TOP)
// If KBD!=0 we should choose black, else choose white
@KBD
D=M
@COLOR_BLACK
D;JNE

(COLOR_WHITE)
//Populate R1 with 0 for white, then go to fill
@R1
M=0
@FILL
0;JMP

(COLOR_BLACK)
//Populate R1 with 1 for black
@R1
M=0
M=M-1

(FILL)
@SCREEN
D=A
@R2
M=D

(FILL_LOOP)
	//Get color
	@R1
	D=M
	
	@R2
	//Set color
	A=M
	M=D
	@R2
	M=M+1

	//If R2 is after the screen buffer, goto top
	D=A
	@SCREEN_MAX
	D=D-A
	@TOP
	D;JGE

	//Loop back
	@FILL_LOOP
	0;JMP
