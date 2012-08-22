// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Copy R0 into X
@R0
D=M
@X
M=D

//Clear R2
@R2
M=0

// Loop until X<=0
(LOOP)
	//If X < 0 jump to END
	@X
	D=M
	@END
	D;JLE

	//Add R1 to R2
	@R1
	D=M
	@R2
	M=M+D

	//Decrement X
	@X
	M=M-1

	//Loop back
	@LOOP
	0;JMP
(END)
//Done, now loop for ever
@END
0;JMP 
