	const_def 2 ; object constants
	const PWTDRIFTVEILGATE_OFFICER

PWTDriftveilGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PwtDriftveilGateOfficerScript:
	jumptextfaceplayer PwtDriftveilGateOfficerText

PwtDriftveilGateOfficerText:
	text "The #MON WORLD"
	line "TOUNAMENT brings"
	
	para "in the best"
	line "trainers in UNOVA!"
	done

PWTDriftveilGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  3, DRIFTVEIL_CITY, 1
	warp_event  4,  3, DRIFTVEIL_CITY, 2
	warp_event  3, 14, PWT_OUTSIDE, 4
	warp_event  4, 14, PWT_OUTSIDE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PwtDriftveilGateOfficerScript, -1
	