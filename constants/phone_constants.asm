; PhoneContacts indexes (see data/phone/phone_contacts.asm)
	const_def
	const PHONE_00
	const PHONE_MOM
	const PHONE_BILL
	const PHONE_CHEREN
	const PHONE_BIANCA
	const PHONE_YOUNGSTER_DAN
	const PHONE_SCHOOL_KIDF_JEWEL
	const PHONE_BIRDKEEPER_FREDDY
	const PHONE_SUPERNERD_ERIC
	const PHONE_BEAUTY_LACEY
	const PHONE_SAILOR_STANLEY
	const PHONE_COOLTRAINER_ARIANA
	const PHONE_COOLTRAINER_CARLA
	const PHONE_LASS_CLARISSA
	const PHONE_COOLTRAINER_JENNY
	const PHONE_SCIENTIST_MARCO
	const PHONE_PSYCHIC_MARLA
	; const PHONE_BUG_CATCHER_ARNIE
	; const PHONE_SCHOOLBOY_ALAN
	const PHONE_19
	; const PHONE_LASS_DANA
	; const PHONE_SCHOOLBOY_CHAD
	; const PHONE_POKEFANM_DEREK
	; const PHONE_FISHER_TULLY
	; const PHONE_POKEMANIAC_BRENT
	; const PHONE_PICNICKER_TIFFANY
	; const PHONE_BIRDKEEPER_VANCE
	; const PHONE_FISHER_WILTON
	; const PHONE_BLACKBELT_KENJI
	; const PHONE_HIKER_PARRY
	; const PHONE_PICNICKER_ERIN
	; const PHONE_BUENA

; SpecialPhoneCallList indexes (see data/phone/special_calls.asm)
	const_def
	const SPECIALCALL_NONE
	const SPECIALCALL_BIANCA_INTRO
	const SPECIALCALL_BIANCA_CASTELIA
	const SPECIALCALL_BIANCA_VIRBANK
	const SPECIALCALL_BIANCA_P2
	const SPECIALCALL_CHEREN_NIMBASA
	const SPECIALCALL_CHEREN_MISTRALTON
	const SPECIALCALL_POKERUS
	const SPECIALCALL_ROBBED
	const SPECIALCALL_ASSISTANT
	const SPECIALCALL_WEIRDBROADCAST
	const SPECIALCALL_SSTICKET
	const SPECIALCALL_BIKESHOP
	const SPECIALCALL_WORRIED
	const SPECIALCALL_MASTERBALL

; phone struct members
	const_def
	const PHONE_CONTACT_TRAINER_CLASS
	const PHONE_CONTACT_TRAINER_NUMBER
	const PHONE_CONTACT_MAP_GROUP
	const PHONE_CONTACT_MAP_NUMBER
	const PHONE_CONTACT_SCRIPT1_TIME
	const PHONE_CONTACT_SCRIPT1_BANK
	const PHONE_CONTACT_SCRIPT1_ADDR_LO
	const PHONE_CONTACT_SCRIPT1_ADDR_HI
	const PHONE_CONTACT_SCRIPT2_TIME
	const PHONE_CONTACT_SCRIPT2_BANK
	const PHONE_CONTACT_SCRIPT2_ADDR_LO
	const PHONE_CONTACT_SCRIPT2_ADDR_HI
PHONE_TABLE_WIDTH EQU const_value

; maximum number of pokegear contacts
CONTACT_LIST_SIZE EQU 10
