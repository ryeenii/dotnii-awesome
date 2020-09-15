--
--      ______
--     /      \
--    /        \
--  __| __  __ |__
-- /  \/  \/  \/  \ helpful functions!
-- \__/\__/\__/\__/ all the good stuff from beautiful
--    |  ^  ^  |    amongst some extra stuff is located here.
--    \________/
--       |  |
--      /    \
--     |      |
local btf = require('beautiful')
local grs = require('gears')

function set_wallpaper(s)
  if btf.wallpaper then
    if type(btf.wallpaper) == "function" then
      wp = btf.wallpaper(s)
    end
    grs.wallpaper.maximized(btf.wallpaper, s, true)
  end
end

function startup_error(m, s)
  local nty = require('naughty')
  nty.notify {
		 urgency = "critical",
		 title   = "oh hey, an error happened"..(s and " during startup. you might want to have a look." or ". you might want to have a look."),
     bg = btf.bg_focus,
     fg = btf.bg_normal,
     font = "Hyperspace Race Bold 10",
		 message = m
  }
end

function sig_manage(c)
    client.focus = c
    c:raise()
end

function colorswap(e)
  local xrc = require('beautiful.xresources')
  local xdb = xrc.get_current_theme()
  if not e.cs then
    e.cs = xdb.color3
  else
    if e.cs == xdb.color3 then
      e.cs = xdb.color2
    else if e.cs == xdb.color2 then
      e.cs = xdb.color4
    else if e.cs == xdb.color4 then
      e.cs = xdb.color5
    else if e.cs == xdb.color5 then
      e.cs = xdb.color3
    end
    end
    end
    end 
  end
  return e.cs
end
