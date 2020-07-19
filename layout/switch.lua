--  ___________________
-- /  ___   ___   ___  \
-- | |   | |   | |   | | awesome-switcher settings
-- | |___| |___| |___| | i literally can't live without this extension
-- \___________________/
--
local swt = require('awesome-switcher')
local xrsrc = require('beautiful.xresources')
local xrdb = xrsrc.get_current_theme()
swt.settings.preview_box = true
swt.settings.preview_box_bg = xrdb.background
swt.settings.preview_box_border = xrdb.color3
swt.settings.preview_box_title_color = xrdb.color3
swt.settings.client_opacity = true
swt.settings.client_opacity_value = 0.75
swt.settings.client_opacity_value_in_focus = 0.8
swt.settings.client_opacity_value_selected = 1
