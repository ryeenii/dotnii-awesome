--
--   ____      ____
--  /    \    /    \  célébrer ce l'temps ne s'arrête,
-- /      \  /      \ l'bon de la vie est être heureux!
--
local awf = require('awful')
local srrpfp = require('widgets.sourire.pfp')
local srropt = require('widgets.sourire.options')
function sourire(s)
    s.bar3.visible = false
    s.pfp = false
    if s.pfp then
	s.spfp.visible = true
	s.sname.visible = true
	s.stt.visible = true
    else
    	spfp(s)
    	sopt(s)
    end
    menu = true
end
function rtrn(s)
    s.spfp.visible = false
    s.sname.visible = false
    s.stt.visible = false
    s.bar3.visible = true
    menu = false
end
