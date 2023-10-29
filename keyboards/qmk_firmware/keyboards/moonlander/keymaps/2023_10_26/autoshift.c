#include QMK_KEYBOARD_H
#include "keymap.h"

bool get_custom_auto_shifted_key(uint16_t keycode, keyrecord_t *record) {
    switch(keycode) {
        case KC_PLUS:
        case KC_LBRACKET:
        case KC_LCBR:
        case KC_LPRN:
        case KC_AMPERSAND:
        case KC_EQUAL:
        case KC_RPRN:
        case KC_RCBR:
        case KC_RBRACKET:
        case KC_ASTR:
            return true;
        default:
            return false;
    }
}

void autoshift_press_user(uint16_t keycode, bool shifted, keyrecord_t *record) {
    switch(keycode) {
        case KC_PLUS:
            register_code16((!shifted) ? KC_PLUS : KC_1);
            break;
        case KC_LBRACKET:
            register_code16((!shifted) ? KC_LBRACKET : KC_2);
            break;
        case KC_LCBR:
            register_code16((!shifted) ? KC_LCBR : KC_3);
            break;
        case KC_LPRN:
            register_code16((!shifted) ? KC_LPRN : KC_4);
            break;
        case KC_AMPERSAND:
            register_code16((!shifted) ? KC_AMPR : KC_5);
            break;
        case KC_EQUAL:
            register_code16((!shifted) ? KC_EQUAL : KC_6);
            break;
        case KC_RPRN:
            register_code16((!shifted) ? KC_RPRN : KC_7);
            break;
        case KC_RCBR:
            register_code16((!shifted) ? KC_RCBR : KC_8);
            break;
        case KC_RBRACKET:
            register_code16((!shifted) ? KC_RBRACKET : KC_9);
            break;
        case KC_ASTR:
            register_code16((!shifted) ? KC_ASTR : KC_0);
            break;
        default:
            if (shifted) {
                add_weak_mods(MOD_BIT(KC_LSFT));
            }
            // & 0xFF gets the Tap key for Tap Holds, required when using Retro Shift
            register_code16((IS_RETRO(keycode)) ? keycode & 0xFF : keycode);
    }
}

void autoshift_release_user(uint16_t keycode, bool shifted, keyrecord_t *record) {
    switch(keycode) {
        case KC_PLUS:
            unregister_code16((!shifted) ? KC_PLUS : KC_1);
            break;
        case KC_LBRACKET:
            unregister_code16((!shifted) ? KC_LBRACKET : KC_2);
            break;
        case KC_LCBR:
            unregister_code16((!shifted) ? KC_LCBR : KC_3);
            break; 
        case KC_LPRN:
            unregister_code16((!shifted) ? KC_LPRN : KC_4);
            break;
        case KC_AMPERSAND:
            unregister_code16((!shifted) ? KC_AMPERSAND : KC_5);
            break;
        case KC_EQUAL:
            unregister_code16((!shifted) ? KC_EQUAL : KC_6);
            break;
        case KC_RPRN:
            unregister_code16((!shifted) ? KC_RPRN : KC_7);
            break;
        case KC_RCBR:
            unregister_code16((!shifted) ? KC_RCBR : KC_8);
            break;
        case KC_RBRACKET:
            unregister_code16((!shifted) ? KC_RBRACKET : KC_9);
            break;
        case KC_ASTR:
            unregister_code16((!shifted) ? KC_ASTR : KC_0);
            break;
        default:
            // & 0xFF gets the Tap key for Tap Holds, required when using Retro Shift
            // The IS_RETRO check isn't really necessary here, always using
            // keycode & 0xFF would be fine.
            unregister_code16((IS_RETRO(keycode)) ? keycode & 0xFF : keycode);
    }
}