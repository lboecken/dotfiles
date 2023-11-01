# Set any rules.mk overrides for your specific keymap here.
# See rules at https://docs.qmk.fm/#/config_options?id=the-rulesmk-file
SRC = matrix.c
SRC += leader.c
SRC += leader_sequences.c
CAPS_WORD_ENABLE    = yes
  SRC += caps_word.c
CONSOLE_ENABLE = yes 
COMMAND_ENABLE = no
AUDIO_ENABLE = no
AUTO_SHIFT_ENABLE = yes
	SRC += autoshift.c
TAP_DANCE_ENABLE = yes
SPACE_CADET_ENABLE = no
COMBO_ENABLE = yes
CAPS_WORD_ENABLE = yes