--  _______
--//   ||  \\
--||   ||__|| tik tok (not the app).
--||       || time goes by.
--\\_______//
--

local awf = require('awful')
local grs = require('gears')
local xrc = require('beautiful.xresources')
local xdb = xrc.get_current_theme()
local wib = require('wibox')

function clock(s)
  s.prmpt = awf.widget.prompt()
  s.bar1 = awf.wibar {
    width = 130,
    height = 20,
    ontop = true,
    visible = true,
    bg = xdb.background,
    shape = function(cr, w, h) grs.shape.rounded_rect(cr, w, h, 3) end,
  }
  awf.placement.top_left(s.bar1, {margins = { top = 5, left = 8 }})
  s.clock = wib.widget.textclock('<span font="Hyperspace Race Extended Bold 10">%H:%M:%S</span> %p', 1)
  s.bar1:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.clock
    },
    nil
  }
end
