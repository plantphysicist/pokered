DoClearSaveDialogue:
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
	coord hl, 14, 7
	lb bc, 8, 18
	ld a, NO_YES_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	jp z, Init
	callba ClearSAV
	jp Init

ClearSaveDataText:
	text_far _ClearSaveDataText
	text_end