--
--   ____      ____
--  /    \    /    \  célébrer ce le temps ne s'arrête,
-- /      \  /      \ le bon de la vie est être heureux!
--
local awf = require('awful')
local srrpfp = require('widgets.sourire.pfp')
local srropt = require('widgets.sourire.trois.options')
local srrpwr = require('widgets.sourire.trois.power')
local srrpwr = require('widgets.sourire.mpd')
function sourire(s)
    s.bar3.visible = false
    s.pfp = false
    if s.sname then
        s.spfp.visible = true
        s.sname.visible = true
        s.stt.visible = true
        s.pwr.visible = true
				s.mpd.visible = true
    else
				spfp(s)
				sopt(s)
				spwr(s)
				smpd(s)
    end
    menu = true
end
function rtrn(s)
    s.spfp.visible = false
    s.sname.visible = false
    s.stt.visible = false
    s.pwr.visible = false
		s.mpd.visible = false
    s.bar3.visible = true
    if s.pwoff then
        s.pwtxt.visible = false
        s.pwoff.visible = false
    end
    menu = false
end
