	const_def 2 ; object constants
	const DRIFTVEILBRIDGEGATE_OFFICER

DriftveilBridgeGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

DriftveilBridgeGateBridgeScript:
	turnobject PLAYER, UP
	opentext
	writetext DriftveilBridgeGateOfficerRaiseBridgeText
	waitbutton
	closetext
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	opentext
	writetext DriftveilBridgeGateOfficerText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setmapscene R_5_BRIDGE_GATE, SCENE_FINISHED
	end
	
DriftveilBridgeGateOfficerScript:
	jumptextfaceplayer DriftveilBridgeGateOfficerText

DriftveilBridgeGateOfficerRaiseBridgeText:
	text "Whew! Finally got"
	line "back to my post!"
	
	para "What? You want to"
	line "cross the bridge?"
	
	para "Here, let me lower"
	line "it for you!"
	done
	
DriftveilBridgeGateOfficerText:
	text "The BRIDGE takes"
	line "you straight to"
	cont "NIMBASA CITY."
	done

DriftveilBridgeGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1,  6, DRIFTVEIL_CITY, 5
	warp_event  1,  7, DRIFTVEIL_CITY, 6
	warp_event 12,  6, DRIFTVEIL_DRAWBRIDGE, 1
	warp_event 12,  7, DRIFTVEIL_DRAWBRIDGE, 2

	db 5 ; coord events
	coord_event 10,  5, SCENE_DEFAULT, DriftveilBridgeGateBridgeScript
	coord_event 10,  6, SCENE_DEFAULT, DriftveilBridgeGateBridgeScript
	coord_event 10,  7, SCENE_DEFAULT, DriftveilBridgeGateBridgeScript
	coord_event 10,  8, SCENE_DEFAULT, DriftveilBridgeGateBridgeScript
	coord_event 10,  9, SCENE_DEFAULT, DriftveilBridgeGateBridgeScript

	db 0 ; bg events

	db 1 ; object events
	object_event 10,  3, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DriftveilBridgeGateOfficerScript, -1
	