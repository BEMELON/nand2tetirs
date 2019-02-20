// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    @KBD
    D=M

    @POS // KEY PRESSED
    D;JNE
    @NEG // KEY NOT PRESSED
    D;JEQ

    (POS)
        @SCREEN
        M=-1

        @8192
        D=A
        (POSLOOP)
            @SCREEN
            A=A+D
            M=-1
            D=D-1

            @POSLOOP
            D;JNE


        // JMP for LOOP
        @LOOP
        0;JMP
    
    (NEG)
        @SCREEN
        M=0
        @8192
        D=A
        (NEGLOOP)
            @SCREEN
            A=A+D
            M=0
            D=D-1

            @NEGLOOP
            D;JNE
        
        // JMP for LOOP
        @LOOP
        0;JMP



