--      ______           ________________________________________
--     /      \        //                                        \\
--    /        \       ||   ***reenii's main awesome config***   ||
--  __| __  __ |__     ||  "aka most readable and fun WM that i  ||
-- /  \/  \/  \/  \    ||ever used so far. qtile doesn't counts."||
-- \__/\__/\__/\__/    \\________________________________________//
--    |  .   . |       || done in XX/XX/XXXX on a Lenovo G40-80  ||
--    \________/       //----------------------------------------\\
--       |  |          || huge thanks to JavaCafe01 for helping  ||
--      /    \         ||       me massively in this project!    ||
--     |      |        \\________________________________________//


-- section 1                     ||
-- default configs and libraries ||
-- ______________________________//

-- easy-to-access variables
local vrs = require('vars')
-- default awesome libraries
local grs = require('gears')
local awf = require('awful')
local btf = require('beautiful')
-- helpful functions
local hlp = require('hlp')
local nty = require('naughty')

-- section 2 ||
-- signals   ||
-- __________//

nty.connect_signal("request::display_error", startup_error)
client.connect_signal("manage", sig_manage)

-- section 3     ||
-- load the rest ||
-- ______________//

local keys = require('keys')
local layout = require('layout.layout')
btf.init(themeDir .. "theme.lua") -- [TBD] fix beautiful not loading even with the variable working.
