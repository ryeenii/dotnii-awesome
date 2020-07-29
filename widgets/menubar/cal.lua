--   ________
-- //  2020  \\
-- ||_|_|_|_||| i can't believe it's still 2020!
-- ||_|_|_|_||| when is this year going to end?
-- ||_|_|_|_|||
-- \\________//
--
local awf = require('awful')
local grs = require('gears')
local xrc = require('beautiful.xresources')
local xdb = xrc.get_current_theme()
local wib = require('wibox')

function cal(s)
  s.prmpt = awf.widget.prompt()
  s.bar2 = wib({
    width = 145,
    height = 20,
    ontop = true,
    visible = true,
    bg = xdb.background,
    shape = function(cr, w, h) grs.shape.rounded_rect(cr, w, h, 3) end,
  })
  awf.placement.top_left(s.bar2, {margins = { top = 5, left = 145 }})
  s.cal = wib.widget.textclock('%a <span font="Hyperspace Race Extended Bold 10">%b %d</span> %Y', 1)
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
