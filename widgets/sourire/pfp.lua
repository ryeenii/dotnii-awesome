--  _______   _______
-- /  ___  \ /       \ look, it's you, User!
-- | /. .\ | | User! | zoomed profile pic + name menu
-- | \___/ | \_______/ 
-- \_______/
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local uvrs = require('config.usercfg')
local fnc = require('functions')
local dpi = xrc.apply_dpi
function spfp(s)
  s.prmpt = awf.widget.prompt()
  s.spfp = wib ({
      width = 75,
      height = 75,
      position = 'top',
      ontop = true,
      visible = true,
      border_width = dpi(2),
      border_color = btf.bg_focus,
      bg = btf.bg_normal,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end,
  })
  awf.placement.top_right(s.spfp, {margins = { top = dpi(5), right = dpi(137) }})
  s.pfp = wib.widget {
      image = uvrs.pfpDir,
      resize = true,
      widget = wib.widget.imagebox
  }
  s.spfp:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      buttons = btn,
      s.pfp
    },
    nil
  }
  s.sname = wib ({
      width = 120, 
      height = 33,
      position = 'top',
      ontop = true,
      visible = true,
      border_width = dpi(2),
      border_color = btf.bg_focus,
      bg = btf.bg_normal,
      fg = btf.bg_minimize,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w, h, dpi(3)) end
  })
  awf.placement.top_right(s.sname, {margins = { top = dpi(5), right = dpi(10) }})
  s.nm = wib.widget {
    markup = uvrs.userName,
    font = "Recursive Sans Linear Static Bold 13",
    align = 'center',
    widget = wib.widget.textbox
  } 
  s.sname:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      buttons = btn,
      s.nm
    },
    nil
  }
end
