
local wib = require('wibox')
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful') 
local fnc = require('functions')
local xrc = btf.xresources
local dpi = xrc.apply_dpi
function logout(s)
		s.lgout = wib({
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
    s.lgout.fg = colorswap()
    awf.placement.centered(s.lgout, {margins={top = dpi(100), left = dpi(260)}})
    s.lootx = wib.widget {
      markup = 'ﴚ',
      font = 'RecMono Nerd Font 48',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.loodi = wib.widget {
      markup = 'logout',
      font = 'RecMono Nerd Font Bold 10',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.lgout:setup {
      layout = wib.layout.align.vertical,
      expand = 'none',
      nil,
      {
        layout = wib.layout.fixed.vertical,
        s.lootx
      },
      s.loodi
    }
    s.lgout:buttons({
        awf.button({  }, 1, function() awesome.quit() end)
    })
end
