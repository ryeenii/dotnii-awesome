--  ______  _____
-- |      ||     |
-- |      |\_____/  layout configuration
-- |      | _____   window management and all of that goes here
-- |      ||     |
-- \______/\_____/
--
local fct = require('functions')
local awf = require('awful')
require("layout.switch")
-- main window settings available.
-- you can set it to any of the ones supported by awful.layout!
-- these are my personal 5 picks.
local lyt = awf.layout.suit
local layouts = {
  lyt.tile.left
}

local function perscreen_connect(s)
  set_wallpaper()
  awf.tag({ "爵 web", " chat", " code", " zen", " term" }, s, layouts)
end

awf.screen.connect_for_each_screen(perscreen_connect)
screen.connect_signal("property::geometry", set_wallpaper)
require('layout.rules')
