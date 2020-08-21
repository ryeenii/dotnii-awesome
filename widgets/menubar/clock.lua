--  _______
--//   ||  \\
--||   ||__|| tik tok (not the app).
--||       || time goes by.
--\\_______//
--
local awf = require('awful')
local grs = require('gears')
local wib = require('wibox')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local dpi = xrc.apply_dpi

function clock(s)
  s.bar1 = wib ({
    width = 150,
    height = dpi(25),
    position = 'top',
    ontop = false,
    border_width = dpi(2),
    border_color = btf.bg_focus,
    visible = true,
    bg = btf.bg_normal,
    shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end,
  })
  -- temporary struts placement until issue 3146 is fixed
  s.bar1:struts ({
    top = dpi(31)
  })
  awf.placement.top_left(s.bar1, {margins = { top = dpi(5), left = dpi(7) }})
  s.clock = wib.widget.textclock('<span font="Hyperspace Race Extended Bold 12">%H:%M:%S</span> %p', 1)
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
