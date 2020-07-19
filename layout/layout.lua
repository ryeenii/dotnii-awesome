--  ______  _____
-- |      ||     |
-- |      |\_____/  layout configuration
-- |      | _____   window management and all of that goes here
-- |      ||     |
-- \______/\_____/
--
local hlp = require('hlp')
local awf = require('awful')
local btf = require('beautiful')
local kys = require('keys')
require("layout.switch")
-- main window settings available.
-- you can set it to any of the ones supported by awful.layout!
-- these are my personal 5 picks.
local lyt = awf.layout.suit
local nty = require('naughty')
nty.notification = {
  title = "layout works."
}

local layouts = {
  lyt.tile.left, lyt.tile.right,
  lyt.floating,
  lyt.max, lyt.max.fullscreen
}

local function perscreen_connect(s)
  set_wallpaper()
  awf.tag({ "web", "chat", "zen", "code", "game", "term" }, s, layouts)
end

awf.screen.connect_for_each_screen(perscreen_connect)
screen.connect_signal("property::geometry", set_wallpaper)
require('layout.rules')
