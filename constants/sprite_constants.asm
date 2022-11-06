; sprite ids
; OverworldSprites indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE ; 00
	const SPRITE_CHRIS ; 01
	const SPRITE_CHRIS_BIKE ; 02
	const SPRITE_GAMEBOY_KID ; 03
	const SPRITE_ELDER ; 04
	const SPRITE_MOM ; 05
	const SPRITE_REDS_MOM ; 06
	const SPRITE_COOLTRAINER_M ; 07
	const SPRITE_COOLTRAINER_F ; 08
	const SPRITE_BUG_CATCHER ; 09
	const SPRITE_TWIN ; 0a
	const SPRITE_YOUNGSTER ; 0b
	const SPRITE_LASS ; 0c
	const SPRITE_TEACHER ; 0d
	const SPRITE_BUENA ; 0e
	const SPRITE_SUPER_NERD ; 0f
	const SPRITE_ROCKER ; 10
	const SPRITE_POKEFAN_M ; 11
	const SPRITE_POKEFAN_F ; 12
	const SPRITE_GRAMPS ; 13
	const SPRITE_GRANNY ; 14
	const SPRITE_SWIMMER_GUY ; 15
	const SPRITE_SWIMMER_GIRL ; 16
	const SPRITE_BIG_SNORLAX ; 17
	const SPRITE_SURFING_PIKACHU ; 18
	const SPRITE_ROCKET ; 19
	const SPRITE_ROCKET_GIRL ; 1a
	const SPRITE_NURSE ; 1b
	const SPRITE_LINK_RECEPTIONIST ; 1c
	const SPRITE_CLERK ; 1d
	const SPRITE_FISHER ; 1e
	const SPRITE_FISHING_GURU ; 1f
	const SPRITE_SCIENTIST ; 20
	const SPRITE_SAGE ; 21
	const SPRITE_GENTLEMAN ; 22
	const SPRITE_BLACK_BELT ; 23
	const SPRITE_RECEPTIONIST ; 24
	const SPRITE_OFFICER ; 25
	const SPRITE_BIG_LAPRAS ; 26
	const SPRITE_GYM_GUY ; 27
	const SPRITE_SAILOR ; 28
	const SPRITE_BIKER ; 29
	const SPRITE_PHARMACIST ; 2a
	const SPRITE_MONSTER ; 2b
	const SPRITE_FAIRY ; 2c
	const SPRITE_BIRD ; 2d
	const SPRITE_DRAGON ; 2e
	const SPRITE_BIG_ONIX ; 2f
	const SPRITE_N64 ; 30
	const SPRITE_SUDOWOODO ; 31
	const SPRITE_SURF ; 32
	const SPRITE_POKE_BALL ; 33
	const SPRITE_POKEDEX ; 34
	const SPRITE_PAPER ; 35
	const SPRITE_VIRTUAL_BOY ; 36
	const SPRITE_OLD_LINK_RECEPTIONIST ; 37
	const SPRITE_ROCK ; 38
	const SPRITE_BOULDER ; 39
	const SPRITE_SNES ; 3a
	const SPRITE_FAMICOM ; 3b
	const SPRITE_FRUIT_TREE ; 3c
	const SPRITE_GOLD_TROPHY ; 3d
	const SPRITE_SILVER_TROPHY ; 3e
	const SPRITE_KRIS ; 3f
	const SPRITE_KRIS_BIKE ; 40
	const SPRITE_KURT_OUTSIDE ; 41
	const SPRITE_SUICUNE ; 42
	const SPRITE_ENTEI ; 43
	const SPRITE_RAIKOU ; 44
	const SPRITE_STANDING_YOUNGSTER ; 45
	const SPRITE_MARLON ; 46
	const SPRITE_SHAUNTAL ; 47
	const SPRITE_INFER ; 48
	const SPRITE_FOSSIL ; 49
	const SPRITE_SLEEPING_MAN ; 4a
	const SPRITE_SCIENTIST_F ; 4b
	const SPRITE_HARLEQUIN ; 4c
	const SPRITE_BURGH ; 4d
	const SPRITE_CHEREN ; 4e
	const SPRITE_PZMA_SAGE ; 4f
	const SPRITE_SHADOW ; 50
	const SPRITE_ROXIE ; 51
	const SPRITE_JUNIPER ; 52
	const SPRITE_BIANCA ; 53
	const SPRITE_LENORA ; 54
	const SPRITE_CILAN ; 55
	const SPRITE_CLAY ; 56
	const SPRITE_IRIS ; 57
	const SPRITE_MYSTERYMAN ; 58
	const SPRITE_ROOD ; 59
	const SPRITE_FAN ; 5a
	const SPRITE_SKYLA ; 5b
	const SPRITE_CABLE ; 5c
	const SPRITE_FOUNTAIN ; 5d
	const SPRITE_DRAYDEN ; 5e
	const SPRITE_INFER_SAGE ; 5f
	const SPRITE_BADGE_1 ; 60
	const SPRITE_BADGE_2 ; 61
	const SPRITE_BADGE_3 ; 62
	const SPRITE_BADGE_4 ; 63
	const SPRITE_BADGE_5 ; 64
	const SPRITE_BADGE_6 ; 65
	const SPRITE_BADGE_7 ; 66
	const SPRITE_BADGE_8 ; 67
	const SPRITE_ROUGHNECK ; 68
	const SPRITE_RANGER_M ; 69
	const SPRITE_RANGER_F ; 6a
	const SPRITE_MUSICIAN ; 6b
	const SPRITE_SOCIALITE ; 6c
	const SPRITE_LINEBACKER ; 6d
	const SPRITE_CYCLIST_M ; 6e
	const SPRITE_CYCLIST_F ; 6f
	const SPRITE_MARSHAL ; 70
	const SPRITE_GRIMSLEY ; 71
	const SPRITE_ELESA ; 72
	const SPRITE_COLRESS ; 73

; SpriteMons indexes (see data/sprites/sprite_mons.asm)
	const_def $a0
SPRITE_POKEMON EQU const_value
	const SPRITE_SNEASEL ; a0
	const SPRITE_JIGGLYPUFF ; a1
	const SPRITE_YANMA ; a2
	const SPRITE_LARVESTA ; a3
	const SPRITE_FLAAFFY ; a4
	const SPRITE_GENESECT ; a5
	const SPRITE_TRUBBISH ; a6

; special GetMonSprite values (see engine/overworld/overworld.asm)
	const_def $e0
	const SPRITE_DAY_CARE_MON_1 ; e0
	const SPRITE_DAY_CARE_MON_2 ; e1

; wVariableSprites indexes (see wram.asm)
	const_def $f0
SPRITE_VARS EQU const_value
	const SPRITE_CONSOLE ; f0
	const SPRITE_DOLL_1 ; f1
	const SPRITE_DOLL_2 ; f2
	const SPRITE_BIG_DOLL ; f3
	const SPRITE_WEIRD_TREE ; f4
	const SPRITE_OLIVINE_RIVAL ; f5
	const SPRITE_AZALEA_ROCKET ; f6
	const SPRITE_FUCHSIA_GYM_1 ; f7
	const SPRITE_FUCHSIA_GYM_2 ; f8
	const SPRITE_FUCHSIA_GYM_3 ; f9
	const SPRITE_FUCHSIA_GYM_4 ; fa
	const SPRITE_COPYCAT ; fb
	const SPRITE_JANINE_IMPERSONATOR ; fc
	const SPRITE_VIO ; fd
	const SPRITE_BATTLE_HOUSE_BLUE ; fe
