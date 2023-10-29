# Set any rules.mk overrides for your specific keymap here.
# See rules at https://docs.qmk.fm/#/config_options?id=the-rulesmk-file
SRC = matrix.c
CONSOLE_ENABLE = yes 
COMMAND_ENABLE = no
AUDIO_ENABLE = no
AUTO_SHIFT_ENABLE = yes
	SRC += autoshift.c
TAP_DANCE_ENABLE = yes
SPACE_CADET_ENABLE = no
COMBO_ENABLE = yes
