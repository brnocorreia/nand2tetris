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

(INIT)
	// Inicializa a var do teclado para receber o input.
	@24576
	D=A
	@KEYBOARD
	M=D
(ISPRESSED)
	// Mapeia todos os pixels
	@24575
	D=A
	@CURRENT
	M=D
	// Se o teclado tiver pressionado, a tela fica toda preta.
	@KEYBOARD
	A=M
	D=M
	@FILL
	M=-1
	@DRAW
	D;JNE
	// Limpa a tela.
	@FILL
	M=0
(DRAW)
	// Preenche ou não dependendo do valor inputado.
	@FILL
	D=M
	@CURRENT
	A=M
	M=D
	@CURRENT
	D=M
	@16384
	D=D-A
	@ISPRESSED
	D;JLE
	// Decrementa o map do pixel
	@CURRENT
	M=M-1
	// Continua desenhando o pixel map
	@DRAW
	0;JMP