--  ____   ____   ____   ____   
-- /    \ /    \ /    \ /    \ pick your
-- |    | |    | |    | |    | sides!
-- \____/ \____/ \____/ \____/
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local fnc = require('functions')
local dpi = xrc.apply_dpi
function sopt(s)
  s.prmpt = awf.widget.prompt()
  s.stt = wib({
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
  s.stt.fg = colorswap(s)
  awf.placement.top_right(s.stt, {margins = { top = dpi(45), right = dpi(105) }})
  s.stx = wib.widget {
    markup = ' ',
    font = 'Jetbrains Mono Nerd Font 15',
    align = 'center',
    widget = wib.widget.textbox
  }
  s.stt:setup {
    layout = wib.layout.align.horizontal,
    expand = 'none',
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.stx
    },
    nil
  }
end
