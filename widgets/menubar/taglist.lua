--  _________________________
-- /                         \
-- | [1] | 2 | 3 | 4 | 5 | 6 |
-- \_________________________/
local awf = require('awful')
local btf = require('beautiful')
local wib = require('wibox')
local grs = require('gears')
local fnt = require('functions')
local xrc = require('beautiful.xresources')
local dpi = xrc.apply_dpi

function tags(s)
  s.prmpt = awf.widget.prompt()
  s.bar4 = wib({
      width = 300,
      height = 25,
      position = 'bottom',
      ontop = false,
      visible = true,
      border_width = dpi(2),
      border_color = btf.bg_focus,
      bg = btf.bg_normal,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end
  })
  -- temporary struts placement until issue 3146 is fixed
  s.bar4:struts({
      bottom = dpi(31)
  })
  awf.placement.bottom_left(s.bar4, {margins = { bottom = dpi(5), left = dpi(7) }})
  s.taglist = awf.widget.taglist {
    screen = s,
    filter = awf.widget.taglist.filter.all,
    style = {
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end,
      spacing = 5,
      font = btf.alt_font
    }
  } 
  s.bar4:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.taglist
    },
    nil
  }
end
