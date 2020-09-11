local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local wib = require('wibox')
local vrs = require('vars')
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
  local btn = grs.table.join(
    awf.button({  }, 3, function()
        local srr = require('widgets.sourire')
        awf.screen.connect_for_each_screen(rtrn)
    end)
  )
  awf.placement.top_right(s.spfp, {margins = { top = dpi(5), right = dpi(150) }})
  s.pfp = wib.widget {
      image = vrs.pfpDir,
      resize = true,
      clip_shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(2)) end,
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
      width = 130,
      height = 33,
      position = 'top',
      ontop = true,
      visible = true,
      border_width = dpi(2),
      border_color = btf.bg_focus,
      bg = btf.bg_normal,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w, h, dpi(3)) end
  })
  awf.placement.top_right(s.sname, {margins = { top = dpi(5), right = dpi(10) }})
  s.nm = wib.widget {
    markup = vrs.userName,
    font = "Hyperspace Race Extended Heavy 16",
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
