--
--   ____      ____
--  /    \    /    \  célébrer ce l'temps ne s'arrête,
-- /      \  /      \ l'bon de la vie est être heureux!
--
local awf = require('awful')
local srrpfp = require('widgets.sourire.pfp')
function sourire(s)
    s.bar3.visible = false
    spfp(s)
    menu = true
end
function rtrn(s)
    s.spfp.visible = false
    s.sname.visible = false
    s.bar3.visible = true
    menu = false
end
