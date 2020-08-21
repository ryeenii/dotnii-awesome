--  _______
-- /  ___  \
-- | /. .\ |  it's you!
-- | \___/ |  you look charming, i can tell you that.
-- \_______/
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local vrs = require('vars')
local dpi = xrc.apply_dpi

function pfp(s)
  s.prmpt = awf.widget.prompt()
  s.bar3 = wib ({
    width = 25,
    height = dpi(25),
    position = 'top',
    ontop = false,
    visible = true,
    border_width = dpi(2),
    border_color = btf.bg_focus,
    bg = btf.bg_normal,
    shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end,
  })
  awf.placement.top_right(s.bar3, {margins = { top = dpi(5), right = dpi(7) }})
  s.pfp = wib.widget {
      image = vrs.pfpDir,
      resize = true,
      clip_shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(2)) end,
      widget = wib.widget.imagebox
  }
  s.bar3:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.pfp
    },
    nil
  }
end
