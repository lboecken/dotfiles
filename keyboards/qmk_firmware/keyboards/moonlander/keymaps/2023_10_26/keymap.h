#pragma once
#include QMK_KEYBOARD_H

#define DELAY_LONG  wait_ms(900)
#define DELAY       wait_ms(600)
#define DELAY_SHORT wait_ms(300)

#define KC_MAC_UNDO LGUI(KC_Z)
#define KC_MAC_CUT LGUI(KC_X)
#define KC_MAC_COPY LGUI(KC_C)
#define KC_MAC_PASTE LGUI(KC_V)
#define KC_PC_UNDO LCTL(KC_Z)
#define KC_PC_CUT LCTL(KC_X)
#define KC_PC_COPY LCTL(KC_C)
#define KC_PC_PASTE LCTL(KC_V)
#define ES_LESS_MAC KC_GRAVE
#define ES_GRTR_MAC LSFT(KC_GRAVE)
#define ES_BSLS_MAC ALGR(KC_6)
#define NO_PIPE_ALT KC_GRAVE
#define NO_BSLS_ALT KC_EQUAL
#define LSA_T(kc) MT(MOD_LSFT | MOD_LALT, kc)
#define BP_NDSH_MAC ALGR(KC_8)
#define SE_SECT_MAC ALGR(KC_6)

#define _____ KC_TRANSPARENT
#define __o__ KC_TRANSPARENT
#define _LYR_ KC_TRANSPARENT  // Used for indicating (in code) which key is being held for the layer
#define __x__ KC_NO


#define KC_CARROT KC_CIRCUMFLEX
#define KC_CROT   KC_CARROT
#define KC_KROT   KC_CARROT
#define KC_PERIOD KC_DOT
#define KC_DASH   KC_MINUS
#define KC_TACK   KC_MINUS
#define KC_STAR   KC_ASTERISK
#define KC_BANG   KC_EXCLAIM
#define KC_LPAREN KC_LEFT_PAREN
#define KC_RPAREN KC_RIGHT_PAREN