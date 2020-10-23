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
local uvrs = require('config.usercfg')
local grs = require('gears')
local pwrlgo = require('widgets.power-options.logout')
local pwroff = require('widgets.power-options.poweroff')
local pwrrfr = require('widgets.power-options.restart')
local srr = require('widgets.sourire')
function pwrRev(s)
  if s.pwtxt then
    if s.sname then
      awf.screen.connect_for_each_screen(rtrn)
    end
    s.pwtxt.visible = true
    s.pwoff.visible = true
    s.lgout.visible = true
    s.rstrt.visible = true
  else
    s.prmpt = awf.widget.prompt()
    s.pwtxt = wib({
        width = 200,
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
    awf.placement.centered(s.pwtxt, {margins={bottom = dpi(100)}})
    s.pwtxw = wib.widget {
      markup = " seeya, " .. uvrs.userName .. "!",
      font = btf.alt_font,
      align = 'center',
      widget = wib.widget.textbox
    }
    s.pwppw = wib.widget {
      image = uvrs.pfpDir,
      resize = true,
      x = 50,
      clip_shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(2)) end,
      widget = wib.widget.imagebox
    }
    s.pwtxt:setup {
      layout = wib.layout.align.horizontal,
      expand = 'none',
      nil,
      {
        layout = wib.layout.fixed.horizontal,
        s.pwppw,
        s.pwtxw
      },
      nil
    }
		poweroff(s)
		logout(s)
		restart(s)
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
    s.pwoff.visible = false
    s.lgout.visible = false
    s.rstrt.visible = false
    menu = false
  else
    return
  end
end
