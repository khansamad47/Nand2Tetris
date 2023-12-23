// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.


(MAINLOOP)
    @KBD
    D=M;
    @SETTOWHITE
    D;JEQ          // If no keyboard input then set value to 0
    @pixel
    M=-1
    @SETSCREEN
    0;JMP
    (SETTOWHITE)
        @pixel
        M=0
    // END of SETTOWHITE
    (SETSCREEN)
        @SCREEN
        D=A
        @screenptr
        M=D                    // screenptr = &screen[0]
        (LOOP)
            @KBD
            D=A 
            @screenptr
            D=D-M
            @MAINLOOP
            D;JEQ              // If &KBD - screenptr == 0 then restart
            @pixel
            D=M
            @screenptr
            A=M                // *screenptr
            M=D                // *screenptr = pixel
            @screenptr
            M=M+1              // screenptr++
            @LOOP
            0;JMP