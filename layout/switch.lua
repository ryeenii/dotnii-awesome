--  ___________________
-- /  ___   ___   ___  \
-- | |   | |   | |   | | awesome-switcher settings
-- | |___| |___| |___| | i literally can't live without this extension
-- \___________________/
--
local swt = require('lib.awesome-switcher')
local btf = require('beautiful')
local fnc = require('functions')
swt.cs = {}
swt.settings.preview_box = true
swt.settings.preview_box_bg = btf.bg_normal
swt.settings.preview_box_border = btf.bg_focus
swt.settings.preview_box_title_color = {"255","255","255",1}
swt.settings.preview_box_title_font = {"Hyperspace Race Bold"}
swt.settings.client_opacity = true
swt.settings.client_opacity_value = 0.75
swt.settings.client_opacity_value_in_focus = 0.8
swt.settings.client_opacity_value_selected = 1
