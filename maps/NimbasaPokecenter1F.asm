	const_def 2 ; object constants
	const NIMBASAPOKECENTER_NURSE
	const NIMBASAPOKECENTER_CLERK
	const NIMBASAPOKECENTER_TRADE_RECEPTIONIST
	const NIMBASAPOKECENTER_BATTLE_RECEPTIONIST
	const NIMBASAPOKECENTER_LINK_RECEPTIONIST
	const NIMBASAPOKECENTER_GRAMPS
	const NIMBASAPOKECENTER_LASS
	const NIMBASAPOKECENTER_TRUBBISH

NimbasaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NimbasaPokecenterNurseScript:
	jumpstd pokecenternurse

NimbasaPokecenterClerkScript:
	jumpstd scalingmart

NimbasaTradeLinkReceptionistScript:
	farjump LinkReceptionistScript_Trade
	
NimbasaBattleLinkReceptionistScript:
	farjump LinkReceptionistScript_Battle
	
NimbasaTimeCapsuleLinkReceptionistScript:
	farjump LinkReceptionistScript_TimeCapsule
	
NimbasaLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

NimbasaPokecenterGrampsScript:
	jumptextfaceplayer NimbasaPokecenterGrampsText

NimbasaPokecenterLassScript:
	jumptextfaceplayer NimbasaPokecenterLassText

NimbasaPokecenterTrubbishScript:
	opentext
	writetext NimbasaPokecenterTrubbishText
	cry TRUBBISH
	waitbutton
	closetext
	end

NimbasaPokecenterGrampsText:
	text "Have you found"
	line "any colored shards"

	para "around? I hear"
	line "there's a place in"

	para "DRIFTVEIL CITY"
	line "where you can"

	para "trade them in for"
	line "something good."
	done

NimbasaPokecenterLassText:
	text "This is my #-"
	line "MON, TRUBBISH!"

	para "I caught it in"
	line "ROUTE 16."

	para "It may be trash,"
	line "but it's my"
	cont "special trash!"
	done

NimbasaPokecenterTrubbishText:
	text "Truuub."
	done

NimbasaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, NIMBASA_CITY, 3
	warp_event  5, 15, NIMBASA_CITY, 3

	db 0 ; coord events
	
	db 1 ; bg events
	bg_event  9,  3, BGEVENT_READ, NimbasaLinkRecordSign

	db 8 ; object events
	object_event  4,  8, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NimbasaPokecenterNurseScript, -1
	object_event  8, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_SCRIPT, 0, NimbasaPokecenterClerkScript, -1
	object_event  2,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NimbasaTradeLinkReceptionistScript, -1
	object_event  4,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NimbasaBattleLinkReceptionistScript, -1
	object_event  6,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NimbasaTimeCapsuleLinkReceptionistScript, -1
	object_event  7,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NimbasaPokecenterGrampsScript, -1
	object_event  1, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NimbasaPokecenterLassScript, -1
	object_event  2, 12, SPRITE_TRUBBISH, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NimbasaPokecenterTrubbishScript, -1
