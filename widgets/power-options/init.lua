--  ___________
-- /     |     \
-- | |   |   | | 
-- | |   |   | | bonne nuit, mon cher.
-- | \_______/ |
-- \___________/
local awf = require('awful')
local wib = require('wibox')
local btf = require('beautiful')
local xrc = btf.xresources
local dpi = xrc.apply_dpi
local grs = require('gears')
local pwrlgo = require('widgets.power-options.logout')
local pwroff = require('widgets.power-options.poweroff')
local pwrrfr = require('widgets.power-options.refresh')
local srr = require('widgets.sourire')
function pwrRev(s)
  if s.pwtxt then
    if s.pfp then
      awf.screen.connect_for_each_screen(rtrn)
    end
    s.pwtxt.visible = true
  else
    s.prmpt = awf.widget.prompt()
    s.pwtxt = wib({
        width = 120,
        height = 30,
        position = 'top',
        ontop = true,
        visible = true,
        border_width = dpi(2),
        border_color = btf.bg_focus,
        bg = btf.bg_normal,
        fg = btf.bg_focus,
        shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end
    })
    awf.placement.centered(s.pwtxt, {margins={top = dpi(30)}})
    s.pwtxw = wib.widget {
      markup = "Power Options",
      font = btf.alt_font,
      align = 'center',
      widget = wib.widget.textbox
    }
    s.pwtxt:setup {
      layout = wib.layout.align.horizontal,
      expand = 'none',
      nil,
      {
        layout = wib.layout.fixed.horizontal,
        s.pwtxw
      },
      nil
    }
  end
  if menu then
    return
  else
    menu = true
  end
end
function pwrFad(s)
  if s.pwtxt then
    s.pwtxt.visible = false
  else
    return
  end
end
