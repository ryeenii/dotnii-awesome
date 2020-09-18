--  ____________________________________
-- | [_] [_] [_] [_] [_] [_] [_] [][][] |
-- | [__][][][][][][][][][][___] [][][] | keybinds/keyboard shortcuts
-- | [___][][][][][][][][][____]        | what is even a mouse anymore?
-- | [__][][][][][][][][][][___]   []   | i honestly don't know.
-- | [_][_][_][_______][][][___] [][][] |
-- \____________________________________/

-- main libraries
local awf = require('awful')
local grs = require('gears')
local swt = require('awesome-switcher')
local vrs = require('config.defcfg')
local uvrs = require('config.usercfg')
-- since most of the keys are case sensitive, let's lowercase them down for easy usage
local modKey = "Mod4"
local altKey = "Mod1"
local ctrl = "Control"
local shift = "Shift"
local term = "st"
--   _________
-- //  __  _  \\ (there was an attempt² trying to make a globe)
-- || /  /\_/ || global keys. most of the average use keys
-- || \_/  __ || are on this section.
-- ||     /_/ ||
-- \\_________//
glkeys = grs.table.join (
  awf.key({modKey, "Shift"}, "Up",
    function () awf.client.swap.bydirection("up") end,
    {description = "swap positions according to direction given [up]", group = "window"}
  ),
  awf.key({modKey, "Shift"}, "Left",
    function() awf.client.swap.bydirection("left") end,
    {description = "swap positions according to direction given [left]", group = "window"}
  ),
  awf.key({modKey, "Shift"}, "Down",
    function() awf.client.swap.bydirection("down") end,
    {description = "swap positions according to direction given [down]", group = "window"}
  ),
  awf.key({modKey, "Shift"}, "Right",
    function() awf.client.swap.bydirection("right") end,
    {description = "swap positions according to direction given [right]", group = "window"}
  ),
  awf.key({altKey}, "Tab",
    function () swt.switch( 1, "Mod1", "Alt_L", "Shift", "Tab") end,
    {description = "window switcher", group = "window"}
  ),
  awf.key({modKey}, "Return",
    function() awf.spawn(term) end,
    {description = "open a terminal", group = "launcher"}
  ),
  awf.key({modKey, "Shift"}, "d",
    function() awf.spawn("sh " .. uvrs.rofi or vrs.rofi)  end,
    {description = "run prompt (xdg mode)", group = "launcher"}
  ),
  awf.key({modKey}, "d",
    function() awf.spawn("sh " .. uvrs.rofiRun or vrs.rofiRun) end,
    {description = "run prompt", group = "launcher"}
  ),
  awf.key({modKey, "Shift"}, "e",
    function() awf.spawn("sh " .. uvrs.rofiRun or vrs.rofiEmoji) end,
    {description = "emoji prompt", group = "launcher"}
  ),
  awf.key({modKey, "Shift"}, "r",
    awesome.restart,
    {description = "reload awesome", group = "awesome"}
  ),
  awf.key({modKey}, "space",
    function() awf.layout.inc(1) end,
    {description = "change layout type", group = "layout"}
  ),
  awf.key({ctrl}, "Print",
    function() awf.spawn("sh " .. uvrs.scr or vrs.scr) end,
    {description = "take a screenshot", group = "launcher"}
  ),
  awf.key({modKey}, "e",
    function()
      local srr = require('widgets.sourire')
      if not menu then
        awf.screen.connect_for_each_screen(sourire)
      else
        awf.screen.connect_for_each_screen(rtrn)
      end
    end,
    {description = "toggle sourire menu", group = "sourire"}
  ),
  awf.key({modKey}, "Escape",
  	function() awesome.quit() end,
	{description = "quit awesome", group = "seeya!"})
)
--  ___________
-- /           \
-- |           | client/window keys. 
-- |           | this is where all the extravaganza
-- |           | with your programs goes!
-- \__________/
clkeys = grs.table.join(
		awf.key({modKey, "Shift"}, "q",
				function(c) c:kill() end,
        {description = "close client", group = "client"}
		),
    awf.key({modKey}, "s",
      awf.client.floating.toggle,
      {description = "toggle client floating", group="client"}
    ),
    awf.key({modKey}, "m",
      function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
      {description = "toggle client maximized", group="client"}
    ),
	awf.key({modKey}, "t", 
		function (c) 
				c.ontop = not c.ontop 
		end,
    {description = "toggle client on top", group="client"}
		)
)
--   ______________
--  /              \
-- | [1] 2 3 4 5 6 | tag/workspace buttons!
-- \_______________/
--
for i = 1, 9 do
  glkeys = grs.table.join(glkeys,
                          awf.key({modKey}, "#" .. i + 9,
                            function()
                              local scr = awf.screen.focused()
                              local tag = scr.tags[i]
                              if tag then
                                tag:view_only() -- TODO: i really need to figure out how to focus the client window automatically when swapping tags
                              end
                            end,
                            {description = "view tag", group = "tag"}
                          ),
                          awf.key({ modKey, "Shift" }, "#" .. i + 9,
                            function ()
                              if client.focus then
                                local tag = client.focus.screen.tags[i]
                                if tag then
                                  client.focus:move_to_tag(tag)
                                end
                              end
                            end,
                            {description = "move focused client to tag #"..i, group = "tag"}
                          )
  )
end
  --   ________
  --  /___ ___ \
  -- ||   |   || and last,
  -- ||___|___|| but not least:
  -- |         | mouse/client buttons!
  -- |         | they are really simple, but at the same time really efficient.
  -- \________/
clbuttons = grs.table.join(
  awf.button({ }, 1, function (c)
      if not c then return end client.focus = c; c:raise()
  end), 
  awf.button({ }, 3, function()
      local srr = require('widgets.sourire')
      if not menu then
        return
      else
        awf.screen.connect_for_each_screen(rtrn)
      end
  end),
    awf.button({ modKey }, 1, awf.mouse.client.move),
    awf.button({ modKey }, 3, awf.mouse.client.resize)
)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
  -- in order to load the keys *at all*, this small root.keys classification is necessary
root.keys(glkeys)
root.buttons(clbuttons)
