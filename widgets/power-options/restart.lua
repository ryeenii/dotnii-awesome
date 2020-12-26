local wib = require('wibox')
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful') 
local fnc = require('functions')
local xrc = btf.xresources
local dpi = xrc.apply_dpi
function restart(s)
		s.rstrt = wib({
        width = 120,
        height = 120,
        position = 'top',
        ontop = true,
        visible = true,
        border_width = dpi(2),
        border_color = btf.bg_focus,
        bg = btf.bg_normal,
        shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end
    })
    s.rstrt.fg = colorswap()
    awf.placement.centered(s.rstrt, {margins={top = dpi(100), right = dpi(260)}})
    s.rsttx = wib.widget {
      markup = '',
      font = 'RecMono Nerd Font 48',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.rstdi = wib.widget {
      markup = 'restart',
      font = 'RecMono Nerd Font Bold 10',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.rstrt:setup {
      layout = wib.layout.align.vertical,
      expand = 'none',
      nil,
      {
        layout = wib.layout.fixed.vertical,
        s.rsttx
      },
      s.rstdi
    }
    s.rstrt:buttons({
        awf.button({  }, 1, function() awf.spawn("reboot") end)
    })
end
