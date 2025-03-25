	const_def 2 ; object constants
	const PINWHEELBRIDGEGATE_OFFICER

PinwheelBridgeGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PinwheelBridgeGateOfficerScript:
	jumptextfaceplayer PinwheelBridgeGateOfficerText

PinwheelBridgeGateOfficerText:
	text "Be careful not to"
	line "get lost in the"
	cont "forest."
	
	para "Stick to the road"
	line "to get to town."
	done

PinwheelBridgeGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 14, PINWHEEL_FOREST, 1
	warp_event  4, 14, PINWHEEL_FOREST, 1
	warp_event  3,  3, SKYARROW_BRIDGE, 3
	warp_event  4,  3, SKYARROW_BRIDGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_SCRIPT, 0, PinwheelBridgeGateOfficerScript, -1
	