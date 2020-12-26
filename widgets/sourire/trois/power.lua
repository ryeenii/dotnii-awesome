--  ____   ____   ____   
-- /    \ /    \ /    \ pick your
-- |    | |    | |    | sides!
-- \____/ \____/ \____/
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local fnc = require('functions')
local dpi = xrc.apply_dpi
function spwr(s)
  s.prmpt = awf.widget.prompt()
  s.pwr = wib({
      width = 35,
      height = 35,
      position = 'top',
      ontop = true,
      visible = true,
      border_width = dpi(2),
      border_color = btf.bg_focus,
      bg = btf.bg_normal,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end
  })
  s.pwr.fg = colorswap(s)
  awf.placement.top_right(s.pwr, {margins = { top = dpi(45), right = dpi(10) }})
  s.ptx = wib.widget {
    markup = '⏻',
    font = 'RecMono Nerd Font 15',
    align = 'center',
    widget = wib.widget.textbox
  }
  s.pwr:setup {
    layout = wib.layout.align.horizontal,
    expand = 'none',
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.ptx
    },
    nil
  }
  s.pwr:buttons({
    awf.button({ }, 1, function()
      local pwr = require("widgets.power-options")
      awf.screen.connect_for_each_screen(pwrRev)
    end)
  })
end
