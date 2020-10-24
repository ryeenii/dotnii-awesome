local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local xdb = xrc.get_current_theme()
local wib = require('wibox')
local nty = require('naughty')
local dpi = xrc.apply_dpi
local uvrs = require('config.usercfg')
function menutool(s)
		s.prmpt = awf.widget.prompt()
		s.bar5 = wib({
				width = 80,
				height = dpi(25),
				ontop = false,
				visible = true,
				border_width = dpi(2),
				border_color = btf.bg_focus,
				bg = btf.bg_normal,
				shape = function(cr, w, h) grs.shape.rounded_rect(cr, w, h, dpi(3)) end
		})
		awf.placement.bottom_right(s.bar5, {margins = { bottom = dpi(5), right = 5 }})
		s.mnt = wib.widget {
				markup = '<b>drun </b>',
				align = 'center',
				widget = wib.widget.textbox
		}
		s.bar5:setup {
				layout = wib.layout.align.horizontal,
				expand = "none",
				nil,
				{
						layout = wib.layout.fixed.horizontal,
						s.mnt,
				},
				nil
		}
		rofimode = uvrs.rofi
		s.bar5:buttons {
				awf.button({ }, 3, function()
						if s.mnt.markup == '<b>drun </b>' then
								s.mnt.markup = '<b>run </b>'
								rofimode = uvrs.rofiRun
						else
								s.mnt.markup = '<b>drun </b>'
								rofimode = uvrs.rofi
						end
				end),
				awf.button({ }, 1, function()
						awf.spawn(rofimode)
				end)
		}
end
