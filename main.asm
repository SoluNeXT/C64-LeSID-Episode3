#importonce

BasicUpstart2(main)


* = * "MAIN"
main:{

		jsr	MUSICS.RESET

		lda #0
		jsr	MUSICS.INIT

		//lda #1 + 2 + 4
		//jsr MUSICS.DISABLEVOICES

	loop:
		WaitRasterLine(40)
		SetBorderColor(13)
		jsr MUSICS.PLAY
		SetBorderColor(14)

		jmp loop
}


#import "./libs/l_vic.asm"
#import "./libs/l_musics.asm"
#import "./assets/a_musics.asm"

