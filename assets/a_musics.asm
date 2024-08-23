#importonce

#import "../macros/m_musics.asm"

* = * "A_MUSICS"
.namespace MUSICS{

	NbMusics:
		.byte	1

	MusicsTable:
		.word	Music0



	InstrumentsTable:
		.word	Instrument0
		.word	Instrument1

	Instrument0:{		//Voir pour transformer ça avec une macro !
		.label Waveform 	=	MUSICS.WAVEFORM_RECTANGLE
		.label Attack		=	0
		.label Decay		=	12
		.label Sustain		=	0
		.label Release		=	0
		.label PulseWidth	=	2048	// 0 ---> 4096 Uniquement pour les RECTANGLE

		.byte	Waveform
		.byte	Attack  * 16 + Decay
		.byte	Sustain * 16 + Release
		.word	PulseWidth
	}

	Instrument1:{		//Voir pour transformer ça avec une macro !
		.label Waveform 	=	MUSICS.WAVEFORM_TRIANGLE
		.label Attack		=	0
		.label Decay		=	9
		.label Sustain		=	0
		.label Release		=	0
		.label PulseWidth	=	0	// 0 ---> 4096

		.byte	Waveform
		.byte	Attack  * 16 + Decay
		.byte	Sustain * 16 + Release
		.word	PulseWidth
	}

	Patterns:{
		Pat0:{
				//  BYTE : bits 0=>5 : Instrument ID
				//		   bit 6 : 0 = cut then play new frequency | 1 = no cut
				//		   bit 7 : 0 = nothing | 1 = end of pattern
				//	WORD : Note Frequency
				//  BYTE : Note Length : qc=0,tc=1,dc=2,c=4,n=8,b=16,r=32,dr=64

			.byte	0 								// Instrument0
			.word	GetNoteFrequency("DO",4)		// Note et octave
			.byte	4 								// Croche Durée

			SetNote(0,"MI",4,4)

			// On va faire aussi une macro !

			SetNote(0,"SOL",4,4)

			SetNote(0,"DO",5,4)

			SetEndOfPattern()

		}
		Pat1:{
			SetNote(1,"DO",4,4)
			SetNote(1,"SOL",3,4)
			SetNote(1,"MI",3,4)
			SetNote(1,"DO",3,4)
			SetEndOfPattern()
		}
		Pat2:{
			SetNote(1,"MI",4,4)
			SetNote(1,"FA",4,4)
			SetNote(1,"RE",4,4)
			SetNote(1,"MI",4,4)
			SetEndOfPattern()
		}
		Pat3:{
			SetNote(0,"DO",4,1)
			SetNote(0,"RE",4,1)
			SetNote(0,"DO",4,1)
			SetNote(0,"RE",4,1)
			SetNote(0,"FA",4,4)
			SetNote(0,"RE",4,4)
			SetNote(0,"MI",4,4)
			SetEndOfPattern()
		}
	}

	Music0:{
		VolumeAndFilterMode:
		.byte	15
		FilterCutFreq:
		.word	0
		FilterControl:
		.byte	0
		ActiveVoices:	
		.byte	1 + 2 + 4 //bit0=1=voix1 //bit1=2=voix2 //bit2=4=voix3
		Speed:
		.byte	8
		NbPatternsPerVoice:
		.byte	4
		PatternsVoice1Table:
		.byte	0,3,3,64 + 0	// 0 < n < 63 = IDPattern (bits 0 à 5) + bit 6 = JUMP TO PATTERN POSITION n
							//									   + bit 7 = STOP
		PatternsVoice2Table:
		.byte	1,1,1,128
		PatternsVoice3Table:
		.byte	2,2,2,128

		PatternsTable:
		.word	Patterns.Pat0
		.word	Patterns.Pat1
		.word	Patterns.Pat2
		.word	Patterns.Pat3



	}



}