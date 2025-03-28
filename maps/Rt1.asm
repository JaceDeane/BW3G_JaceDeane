	const_def 2 ; object constants
	const R1_FRUIT_TREE
	const R1_HEAVY_BALL
	const R1_PROTEIN
	const R1_PKMN_RANGERM
	const R1_PKMN_RANGERF
	const R1_MAID
	const R1_BLACKBELT
	const R1_BATTLE_GIRL
	const R1_TWIN1
	const R1_TWIN2

Rt1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerMaidR1:
	trainer MAID, MAID_R1, EVENT_BEAT_MAID_R1, MaidR1SeenText, MaidR1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_MAID_CLARISSA
	opentext
	checkflag ENGINE_CLARISSA_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_MAID_CLARISSA
	iftrue .NumberAccepted
	checkevent EVENT_CLARISSA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext MaidR1AfterText
	buttonsound
	setevent EVENT_CLARISSA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .ContinueAskForPhoneNumber
	
.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_MAID_CLARISSA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	setflag ENGINE_CLARISSA
	trainertotext MAID, MAID_R1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted
	
.ChooseRematch:
	scall .Rematch
	winlosstext MaidR1BeatenText, 0
	checkevent EVENT_BEAT_POKEMON_LEAGUE
	iftrue .LoadFight3
	checkmapscene SEASIDE_CAVE_CHAMBER
	ifequal SCENE_FINISHED, .LoadFight2
	checkevent EVENT_FINISHED_PWT
	iftrue .LoadFight1
; Fight0
	loadtrainer MAID, MAID_R1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CLARISSA_READY_FOR_REMATCH
	jump .Gift
	
.LoadFight1
	loadtrainer MAID, CLARISSA_REMATCH_1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CLARISSA_READY_FOR_REMATCH
	jump .Gift
	
.LoadFight2
	loadtrainer MAID, CLARISSA_REMATCH_2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CLARISSA_READY_FOR_REMATCH
	jump .Gift
	
.LoadFight3
	loadtrainer MAID, CLARISSA_REMATCH_3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CLARISSA_READY_FOR_REMATCH
	; fallthrough
	
.Gift:
	opentext
	scall .GiftText
	scall .GiveGift
	ifequal FALSE, .PackIsFull
	end
	
.AskNumber1:
	jumpstd asknumber1f
	end
	
.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

.GiftText:
	jumpstd giftf
	end

.PackIsFull:
	jumpstd packfullf
	end
	
.GiveGift:
	rematchgift HIDDENGROTTO_TIER_2

TrainerPkmnRangerMR1:
	trainer PKMN_RANGERM, PKMN_RANGERM_R1, EVENT_BEAT_PKMN_RANGERM_R1, PkmnRangerMR1SeenText, PkmnRangerMR1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PkmnRangerMR1AfterText
	waitbutton
	closetext
	end

TrainerPkmnRangerFR1:
	trainer PKMN_RANGERF, PKMN_RANGERF_R1, EVENT_BEAT_PKMN_RANGERF_R1, PkmnRangerFR1SeenText, PkmnRangerFR1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PkmnRangerFR1AfterText
	waitbutton
	closetext
	end

TrainerBlackbeltR1:
	trainer BLACKBELT_T, BLACKBELT_R1, EVENT_BEAT_BLACKBELT_R1, BlackbeltR1SeenText, BlackbeltR1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltR1AfterText
	waitbutton
	closetext
	end

TrainerBattleGirlR1:
	trainer BATTLE_GIRL, BATTLE_GIRL_R1, EVENT_BEAT_BATTLE_GIRL_R1, BattleGirlR1SeenText, BattleGirlR1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BattleGirlR1AfterText
	waitbutton
	closetext
	end

TrainerTwinsR1:
	trainer TWINS, TWINS_R1, EVENT_BEAT_TWINS_R1, TwinsR1SeenText, TwinsR1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsR1AfterText
	waitbutton
	closetext
	end
	
R1FruitTree:
	fruittree FRUITTREE_R_1
	
R1HeavyBall:
	itemball HEAVY_BALL
	
R1Protein:
	itemball PROTEIN
	
R1FullRestore:
	hiddenitem FULL_RESTORE, EVENT_R1_FULL_RESTORE
	
R1BigMushroom:
	hiddenitem BIG_MUSHROOM, EVENT_R1_BIG_MUSHROOM

R1Sign:
	jumptext R1SignText
	
PkmnRangerMR1SeenText:
	text "I choose a move,"
	line "and my #MON"
	cont "will do the move."

	para "In a moment, that"
	line "move will reach"
	cont "your #MON!"
	done

PkmnRangerMR1BeatenText:
	text "I lost, but during"
	line "the battle, we"
	
	para "were connected,"
	line "right?"
	done

PkmnRangerMR1AfterText:
	text "From today to"
	line "tomorrow… people,"

	para "#MON, and the"
	line "world… They're all"
	
	para "connected, you"
	line "know?"
	done
	
PkmnRangerFR1SeenText:
	text "Hm? You're headed"
	line "for the JUNIPER"

	para "#MON LAB, aren't"
	line "you? Didn't you"

	para "know? There's a new"
	line "PROF. there now!"
	done

PkmnRangerFR1BeatenText:
	text "You're not an"
	line "opponent one could"
	
	para "defeat without"
	line "trying!"
	done

PkmnRangerFR1AfterText:
	text "I came all the way"
	line "here to hear PROF."

	para "BIANCA talk! She"
	line "used to be a "
	cont "#MON trainer,"

	para "so I bet we'd"
	line "have a great time"
	cont "swapping tales!"
	done
	
MaidR1SeenText:
	text "What? A battle at"
	line "a place like this?"
	
	para "Everyone is"
	line "watching us!"
	done

MaidR1BeatenText:
	text "Well, thanks to"
	line "you, I've overcome"
	
	para "my performance"
	line "anxiety."
	done

MaidR1AfterText:
	text "I guess I just"
	line "need to keep"
	
	para "pushing my"
	line "boundaries if I"
	
	para "want to overcome"
	line "my anxiety…"
	done
	
BlackbeltR1SeenText:
	text "This is my path!"
	done

BlackbeltR1BeatenText:
	text "This is everyone's"
	line "path!"
	done

BlackbeltR1AfterText:
	text "Go forth on your"
	line "path!"
	done
	
BattleGirlR1SeenText:
	text "Let me test what"
	line "fighting style is"
	cont "more effective!"
	done

BattleGirlR1BeatenText:
	text "By any chance, are"
	line "you a battle"
	cont "genius?"
	done

BattleGirlR1AfterText:
	text "To get stronger,"
	line "have battles with"
	cont "your friends!"
	done
	
TwinsR1SeenText:
	text "My sister and I"
	line "are of one mind!"
	done

TwinsR1BeatenText:
	text "Wow! We lost!"
	done

TwinsR1AfterText:
	text "We have to get"
	line "stronger so we can"
	
	para "take care of each"
	line "other!"
	done
	
R1SignText:
	text "ROUTE 1"
	
	para "North to ACCUMULA"
	line "TOWN, south to"
	cont "NUVEMA TOWN."
	done

Rt1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 38, R_1_R_17_GATE, 3
	warp_event  6, 39, R_1_R_17_GATE, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event 31, 27, BGEVENT_READ, R1Sign
	bg_event 23, 12, BGEVENT_ITEM, R1FullRestore
	bg_event 25, 24, BGEVENT_ITEM, R1BigMushroom

	db 10 ; object events
	object_event 31, 40, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, R1FruitTree, -1
	object_event 26,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, R1HeavyBall, EVENT_R1_HEAVY_BALL
	object_event 18, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, R1Protein, EVENT_R1_PROTEIN
	object_event 27, 23, SPRITE_RANGER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPkmnRangerMR1, -1
	object_event 30, 23, SPRITE_RANGER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_TRAINER, 2, TrainerPkmnRangerFR1, -1
	object_event 29,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerMaidR1, -1
	object_event 27, 38, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltR1, -1
	object_event 20, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBattleGirlR1, -1
	object_event 33, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTwinsR1, -1
	object_event 33, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTwinsR1, -1
	