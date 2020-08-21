--   ________
-- //  2020  \\
-- ||_|_|_|_||| i can't believe it's still 2020!
-- ||_|_|_|_||| when is this year going to end?
-- ||_|_|_|_|||
-- \\________//
--
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local dpi = xrc.apply_dpi

function cal(s)
  s.prmpt = awf.widget.prompt()
  s.bar2 = wib({
    width = 155,
    height = dpi(25),
    ontop = false,
    visible = true,
    border_width = dpi(2),
    border_color = btf.bg_focus,
    bg = btf.bg_normal,
    shape = function(cr, w, h) grs.shape.rounded_rect(cr, w, h, dpi(3)) end,
  })
  awf.placement.top_left(s.bar2, {margins = { top = dpi(5), left = 165 }})
  s.cal = wib.widget.textclock('%a <span font="Hyperspace Race Extended Bold 12">%b %d</span> %Y', 1)
  s.bar2:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.cal
    }
  }
end
