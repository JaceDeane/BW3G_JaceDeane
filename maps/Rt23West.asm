	const_def 2 ; object constants
	const R23WEST_DUMMY_OFFICER
	const R23WEST_OFFICER7
	const R23WEST_BOULDER_1
	const R23WEST_BOULDER_2
	const R23WEST_BOULDER_3
	const R23WEST_BOULDER_4
	const R23WEST_BOULDER_5
	const R23WEST_IRON
	const R23WEST_FULL_RESTORE
	const R23WEST_PP_MAX
	const R23WEST_TM_FLAMETHROWER
	const R23WEST_ACE_TRAINERM_2
	const R23WEST_ACE_TRAINERF_2
	const R23WEST_BACKPACKERM
	const R23WEST_BACKPACKERF
	const R23WEST_PKMN_RANGERM
	const R23WEST_PKMN_RANGERF
	const R23WEST_BATTLE_GIRL
	const R23WEST_VETERANM

Rt23West_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .SetTiles
	callback MAPCALLBACK_STONETABLE, .SetUpStoneTable

.DummyScene0:
	end

.DummyScene1:
	end
	
.SetTiles:
	checkevent EVENT_R23_WEST_UPPER_LEVEL
	iffalse .boulders
	changeblock 58,  8, $6a ; 
	changeblock 58, 10, $6a ; 
	changeblock 58, 12, $02 ; 
	changeblock 48,  6, $75 ; 
	changeblock 50,  6, $a8 ; 
	changeblock 52,  6, $a8 ; 
	changeblock 54,  6, $a8 ; 
	changeblock 56,  6, $6f ; 
	
.boulders
	checkevent EVENT_R23_BOULDER_1
	iffalse .check2
	changeblock 28, 14, $97 ; boulder in pit
.check2
	checkevent EVENT_R23_BOULDER_2
	iffalse .check3
	changeblock 20, 18, $93 ; boulder in pit
.check3
	checkevent EVENT_R23_BOULDER_3
	iffalse .check4
	changeblock 24, 16, $97 ; boulder in pit
.check4
	checkevent EVENT_R23_BOULDER_4
	iffalse .check5
	changeblock 28, 18, $99 ; boulder in pit
.check5
	checkevent EVENT_R23_BOULDER_5
	iffalse .done
	changeblock 40, 18, $93 ; boulder in pit
.done
	return

.SetUpStoneTable:
	usestonetable .StoneTable
	return

.StoneTable:
	stonetable 1, R23WEST_BOULDER_1, .Boulder1
	stonetable 2, R23WEST_BOULDER_2, .Boulder2
	stonetable 3, R23WEST_BOULDER_3, .Boulder3
	stonetable 4, R23WEST_BOULDER_4, .Boulder4
	stonetable 5, R23WEST_BOULDER_5, .Boulder5
	db -1 ; end

.Boulder1:
	pause 30
	scall .FX
	opentext
	writetext R23WestBoulderFellText
	waitbutton
	disappear R23WEST_BOULDER_1
	changeblock 28, 14, $97 ; boulder in pit
	reloadmappart
	closetext
	end

.Boulder2:
	pause 30
	scall .FX
	opentext
	writetext R23WestBoulderFellText
	waitbutton
	disappear R23WEST_BOULDER_2
	changeblock 20, 18, $93 ; boulder in pit
	reloadmappart
	closetext
	end

.Boulder3:
	pause 30
	scall .FX
	opentext
	writetext R23WestBoulderFellText
	waitbutton
	disappear R23WEST_BOULDER_3
	changeblock 24, 16, $97 ; boulder in pit
	reloadmappart
	closetext
	end

.Boulder4:
	pause 30
	scall .FX
	opentext
	writetext R23WestBoulderFellText
	waitbutton
	disappear R23WEST_BOULDER_4
	changeblock 28, 18, $99 ; boulder in pit
	reloadmappart
	closetext
	end

.Boulder5:
	pause 30
	scall .FX
	opentext
	writetext R23WestBoulderFellText
	waitbutton
	disappear R23WEST_BOULDER_5
	changeblock 40, 18, $93 ; boulder in pit
	reloadmappart
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end
	
R23WestUpperScript:
	checkevent EVENT_R23_WEST_UPPER_LEVEL
	iftrue .done
	changeblock 58,  8, $6a ; 
	changeblock 58, 10, $6a ; 
	changeblock 58, 12, $02 ; 
	changeblock 48,  6, $75 ; 
	changeblock 50,  6, $a8 ; 
	changeblock 52,  6, $a8 ; 
	changeblock 54,  6, $a8 ; 
	changeblock 56,  6, $6f ; 
	setevent EVENT_R23_WEST_UPPER_LEVEL
.done
	end
	
R23WestLowerScript:
	checkevent EVENT_R23_WEST_UPPER_LEVEL
	iffalse .done
	changeblock 58,  8, $68 ; 
	changeblock 58, 10, $69 ; 
	changeblock 58, 12, $6b ; 
	changeblock 48,  6, $74 ; 
	changeblock 50,  6, $6d ; 
	changeblock 52,  6, $6d ; 
	changeblock 54,  6, $6d ; 
	changeblock 56,  6, $6e ; 
	clearevent EVENT_R23_WEST_UPPER_LEVEL
.done
	end
	
R23WestBoulder:
	jumpstd strengthboulder

R23Badge7Script:
	turnobject PLAYER, LEFT
	turnobject R23WEST_OFFICER7, RIGHT
	opentext
	writetext R23Officer7StopText
	checkflag ENGINE_RISINGBADGE
	iffalse .nobadge
	buttonsound
	waitsfx
	writetext R23Officer7HaveBadgeText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end
	
.nobadge
	waitbutton
	closetext
	applymovement PLAYER, R23WestMovement
	end

R23Officer7Script:
	faceplayer
	opentext
	checkscene
	ifequal SCENE_FINISHED, .showed
	writetext R23Officer7StopText
	checkflag ENGINE_RISINGBADGE
	iffalse .nobadge
	buttonsound
	waitsfx
	writetext R23Officer7HaveBadgeText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end
	
.nobadge
	waitbutton
	closetext
	end
	
.showed
	writetext R23Officer7HaveBadgeText
	waitbutton
	closetext
	end

TrainerAceTrainerM2R23:
	trainer ACE_TRAINERM_D, ACE_TRAINERM_R23_2, EVENT_BEAT_ACE_TRAINERM_R23_2, AceTrainerM2R23SeenText, AceTrainerM2R23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext AceTrainerM2R23AfterText
	waitbutton
	closetext
	end

TrainerAceTrainerF2R23:
	trainer ACE_TRAINERF, ACE_TRAINERF_R23_2, EVENT_BEAT_ACE_TRAINERF_R23_2, AceTrainerF2R23SeenText, AceTrainerF2R23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext AceTrainerF2R23AfterText
	waitbutton
	closetext
	end

TrainerBackpackerMR23:
	trainer BACKPACKERM, BACKPACKERM_R23, EVENT_BEAT_BACKPACKERM_R23, BackpackerMR23SeenText, BackpackerMR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BackpackerMR23AfterText
	waitbutton
	closetext
	end

TrainerBackpackerFR23:
	trainer BACKPACKERF, BACKPACKERF_R23, EVENT_BEAT_BACKPACKERF_R23, BackpackerFR23SeenText, BackpackerFR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BackpackerFR23AfterText
	waitbutton
	closetext
	end

TrainerPkmnRangerMR23:
	trainer PKMN_RANGERM, PKMN_RANGERM_R23, EVENT_BEAT_PKMN_RANGERM_R23, PkmnRangerMR23SeenText, PkmnRangerMR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PkmnRangerMR23AfterText
	waitbutton
	closetext
	end

TrainerPkmnRangerFR23:
	trainer PKMN_RANGERF, PKMN_RANGERF_R23, EVENT_BEAT_PKMN_RANGERF_R23, PkmnRangerFR23SeenText, PkmnRangerFR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PkmnRangerFR23AfterText
	waitbutton
	closetext
	end

TrainerBattleGirlR23:
	trainer BATTLE_GIRL, BATTLE_GIRL_R23, EVENT_BEAT_BATTLE_GIRL_R23, BattleGirlR23SeenText, BattleGirlR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BattleGirlR23AfterText
	waitbutton
	closetext
	end

TrainerVeteranMR23:
	trainer VETERANM, VETERANM_R23, EVENT_BEAT_VETERANM_R23, VeteranMR23SeenText, VeteranMR23BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VeteranMR23AfterText
	waitbutton
	closetext
	end
	
R23Iron:
	itemball IRON
	
R23FullRestore:
	itemball FULL_RESTORE
	
R23PPMax:
	itemball PP_MAX
	
R23TMFlamethrower:
	itemball TM_FLAMETHROWER
	
R23Calcium:
	hiddenitem CALCIUM, EVENT_R23_CALCIUM
	
R23RareCandy:
	hiddenitem RARE_CANDY, EVENT_R23_RARE_CANDY
	
R23Nugget:
	hiddenitem NUGGET, EVENT_R23_NUGGET
	
R23WestMovement:
	step DOWN
	step_end

R23Officer7StopText:
	text "Stop! Ahead lies"
	line "the path to the"
	cont "#MON LEAGUE."
	
	para "Only those who"
	line "have collected"
	
	para "all 8 #MON"
	line "LEAGUE GYM BADGES"
	cont "may enter."
	
	para "You cannot pass"
	line "here unless you"
	
	para "have the"
	line "LEGENDBADGE."
	done
	
R23Officer7HaveBadgeText:
	text "Oh, that is the"
	line "LEGENDBADGE!"
	
	para "You may pass."
	done
	
R23WestBoulderFellText:
	text "The boulder fell"
	line "through!"
	done
	
AceTrainerM2R23SeenText:
	text "..."
	done

AceTrainerM2R23BeatenText:
	text "..."
	done

AceTrainerM2R23AfterText:
	text "..."
	done
	
AceTrainerF2R23SeenText:
	text "..."
	done

AceTrainerF2R23BeatenText:
	text "..."
	done

AceTrainerF2R23AfterText:
	text "..."
	done
	
BackpackerMR23SeenText:
	text "..."
	done

BackpackerMR23BeatenText:
	text "..."
	done

BackpackerMR23AfterText:
	text "..."
	done
	
BackpackerFR23SeenText:
	text "..."
	done

BackpackerFR23BeatenText:
	text "..."
	done

BackpackerFR23AfterText:
	text "..."
	done
	
PkmnRangerMR23SeenText:
	text "..."
	done

PkmnRangerMR23BeatenText:
	text "..."
	done

PkmnRangerMR23AfterText:
	text "..."
	done
	
PkmnRangerFR23SeenText:
	text "..."
	done

PkmnRangerFR23BeatenText:
	text "..."
	done

PkmnRangerFR23AfterText:
	text "..."
	done
	
VeteranMR23SeenText:
	text "..."
	done

VeteranMR23BeatenText:
	text "..."
	done

VeteranMR23AfterText:
	text "..."
	done
	
BattleGirlR23SeenText:
	text "..."
	done

BattleGirlR23BeatenText:
	text "..."
	done

BattleGirlR23AfterText:
	text "..."
	done

Rt23West_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 28, 15, R_23_WEST, 6
	warp_event 20, 18, R_23_WEST, 6
	warp_event 24, 17, R_23_WEST, 6
	warp_event 29, 18, R_23_WEST, 6
	warp_event 40, 18, R_23_WEST, 6
	warp_event 29, 12, R_23_WEST, 6
	warp_event 52,  4, VICTORY_ROAD_ENTRANCE, 1
	warp_event 53,  4, VICTORY_ROAD_ENTRANCE, 2

	db 8 ; coord events
	coord_event 53,  4, SCENE_DEFAULT, R23Badge7Script
	coord_event 52,  4, SCENE_DEFAULT, R23Badge7Script
	coord_event 41, 15, -1, R23WestUpperScript
	coord_event 42, 15, -1, R23WestUpperScript
	coord_event 41, 17, -1, R23WestLowerScript
	coord_event 42, 17, -1, R23WestLowerScript
	coord_event 64, 10, -1, R23WestLowerScript
	coord_event 64, 11, -1, R23WestLowerScript

	db 3 ; bg events
	bg_event 12, 10, BGEVENT_ITEM, R23Calcium
	bg_event  4, 12, BGEVENT_ITEM, R23RareCandy
	bg_event  8, 19, BGEVENT_ITEM, R23Nugget

	db 19 ; object events
	object_event 70, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, 0, -1
	object_event 51,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, R23Officer7Script, -1
	object_event 28, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R23WestBoulder, EVENT_R23_BOULDER_1
	object_event 19, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R23WestBoulder, EVENT_R23_BOULDER_2
	object_event 22, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R23WestBoulder, EVENT_R23_BOULDER_3
	object_event 28, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R23WestBoulder, EVENT_R23_BOULDER_4
	object_event 34, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R23WestBoulder, EVENT_R23_BOULDER_5
	object_event 47,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, R23Iron, EVENT_R23_IRON
	object_event 25, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, R23FullRestore, EVENT_R23_FULL_RESTORE
	object_event 41,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, R23PPMax, EVENT_R23_PP_MAX
	object_event 41, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, R23TMFlamethrower, EVENT_R23_TM_FLAMETHROWER
	object_event 61, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE_D, OBJECTTYPE_TRAINER, 1, TrainerAceTrainerM2R23, -1
	object_event 56, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerAceTrainerF2R23, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBackpackerMR23, -1
	object_event 31, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerBackpackerFR23, -1
	object_event  5,  6, SPRITE_RANGER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_TRAINER, 2, TrainerPkmnRangerMR23, -1
	object_event 50,  9, SPRITE_RANGER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPkmnRangerFR23, -1
	object_event 54, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBattleGirlR23, -1
	object_event 23,  5, SPRITE_RANGER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerVeteranMR23, -1
	