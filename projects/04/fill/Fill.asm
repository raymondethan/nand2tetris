// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(CHECKKEY)
    @8192
    D=A
    @i
    M=D
    @KBD
    D=M
    @BLACK
    D;JNE
    @WHITE
    D;JEQ
    @LOOP
    0;JMP

(BLACK)
    @SCREEN
    D=M
    @CHECKKEY
    D;JNE
    @i
    M=M-1
    @SCREEN
    D=A
    @i
    D=D+M
    @R0
    M=D
    @0
    D=!A
    @R0
    A=M
    M=D
    @BLACK
    0;JMP


(WHITE)
    @SCREEN
    D=M
    @CHECKKEY
    D;JEQ
    @i
    M=M-1
    @SCREEN
    D=A
    @i
    A=D+M
    M=0
    @WHITE
    0;JMP