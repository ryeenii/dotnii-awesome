-- _____________
--|_____________|
--  ___________
--//\__/\__/\__/\\ the nii-bars!
--|| |        | || i'm not gonna lie, at the beggining
--|| |  ^  ^  | || it was a hassle to get this but
--|| \________/ || the more i learnt, the more i loved it
--\\___________//  just by the fact on how flexible it is.
-- special thanks to elenapan for helping me in this.

local awf = require('awful')
-- here, you load your menubar modules!
-- keep in mind that if you want to add/remove a bar,
-- you have to also remove/add the bar's global function inside the bars
-- function below.
local clb = require('widgets.menubar.clock')
local cab = require('widgets.menubar.cal')
local pfb = require('widgets.menubar.pfp')
function barstop(s)
  clock(s)
  cal(s)
  pfp(s)
end
awf.screen.connect_for_each_screen(barstop)
