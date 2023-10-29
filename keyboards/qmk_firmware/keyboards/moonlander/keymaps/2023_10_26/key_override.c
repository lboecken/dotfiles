#include QMK_KEYBOARD_H
#include "keymap.h"

const key_override_t plus_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_PLUS, KC_1);
const key_override_t lbrc_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LBRACKET, KC_2);
const key_override_t lcbr_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LCBR, KC_3);
const key_override_t lprn_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LPRN, KC_4);
const key_override_t ampr_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_AMPR, KC_5);
const key_override_t equal_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_EQUAL, KC_6);
const key_override_t rprn_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_RPRN, KC_7);
const key_override_t rcbr_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_RCBR, KC_8);
const key_override_t rbrc_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_RBRC, KC_9);
const key_override_t astr_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_ASTR, KC_0);

const key_override_t **key_overrides = (const key_override_t *[]){
    &plus_key_override,
    &lbrc_key_override,
    &lcbr_key_override,
    &lprn_key_override,
    &ampr_key_override,
    &equal_key_override,
    &rprn_key_override,
    &rcbr_key_override,
    &rbrc_key_override,
    &astr_key_override,
    NULL // Null terminate the array of overrides!
};