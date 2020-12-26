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
local swt = require('lib.awesome-switcher')
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
awf.keyboard.append_global_keybindings({
  awf.key({modKey, "Control"}, "Up",
    function () awf.client.swap.bydirection("up") end,
    {description = "swap positions according to direction given [up]", group = "window"}
  ),
  awf.key({modKey, "Control"}, "Left",
    function() awf.client.swap.bydirection("left") end,
    {description = "swap positions according to direction given [left]", group = "window"}
  ),
  awf.key({modKey, "Control"}, "Down",
    function() awf.client.swap.bydirection("down") end,
    {description = "swap positions according to direction given [down]", group = "window"}
  ),
  awf.key({modKey, "Control"}, "Right",
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
    function() awf.spawn("sh " .. uvrs.rofi)  end,
    {description = "run prompt (xdg mode)", group = "launcher"}
  ),
  awf.key({modKey}, "d",
    function() awf.spawn("sh " .. uvrs.rofiRun) end,
    {description = "run prompt", group = "launcher"}
  ),
  awf.key({modKey, "Shift"}, "e",
    function() awf.spawn("sh " .. uvrs.rofiRun) end,
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
    function() awf.spawn("sh " .. uvrs.scr) end,
    {description = "take a screenshot", group = "launcher"}
  ),
  awf.key({ctrl, "Shift"}, "Print",
    function() awf.spawn("sh " .. uvrs.scr .. " -d") end,
    {description = "take a delayed screenshot", group = "launcher"}
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
  	function()
      local pwr = require('widgets.power-options')
      if not menu then
        awf.screen.connect_for_each_screen(pwrRev)
      else
        awf.screen.connect_for_each_screen(pwrFad)
      end
    end,
	{description = "quit awesome", group = "seeya!"})
})
--  ___________
-- /           \
-- |           | client/window keys. 
-- |           | this is where all the extravaganza
-- |           | with your programs goes!
-- \__________/
client.connect_signal("request::default_keybindings", function() 
	awf.keyboard.append_client_keybindings({
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
		),
		awf.key({modKey}, "Left",
				function (c)
						if c.floating then
								c:relative_move(-10, 0, 0, 0)
						end
				end,
				{description = "move floating client to the left by 10px", group="client"}
		),
		awf.key({modKey}, "Right",
				function (c)
						if c.floating then
								c:relative_move(10, 0, 0, 0)
						end
				end,
				{description = "move floating client to the right by 10px", group="client"}
		),
		awf.key({modKey}, "Up",
				function (c)
						if c.floating then
								c:relative_move(0, -10, 0, 0)
						end
				end,
				{description = "move floating client to the top by 10px", group="client"}
		),
		awf.key({modKey}, "Down",
				function (c)
						if c.floating then
								c:relative_move(0, 10, 0, 0)
						end
				end,
				{description = "move floating client to the bottom by 10px", group="client"}
		),
		awf.key({modKey, "Shift"}, "Left",
				function (c)
						if c.floating then
								c:relative_move(0, 0, -10, 0)
						end
				end,
				{description = "resize floating client to the left by 10px", group="client"}
		),
		awf.key({modKey, "Shift"}, "Right",
				function (c)
						if c.floating then
								c:relative_move(0, 0, 10, 0)
						end
				end,
				{description = "resize floating client to the right by 10px", group="client"}
		),
		awf.key({modKey, "Shift"}, "Up",
				function (c)
						if c.floating then
								c:relative_move(0, 0, 0, -10)
						end
				end,
				{description = "resize floating client to the top by 10px", group="client"}
		),
		awf.key({modKey, "Shift"}, "Down",
				function (c)
						if c.floating then
								c:relative_move(0, 0, 0, 10)
						end
				end,
				{description = "resize floating client to the bottom by 10px", group="client"}
		)
	})
end)
--  _______________
-- /               \
-- | [1] 2 3 4 5 6 | tag/workspace buttons!
-- \_______________/
--
for i = 1, 9 do
  awf.keyboard.append_global_keybindings({
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
	})
end
  --   ________
  --  /___ ___ \
  -- ||   |   || and last,
  -- ||___|___|| but not least:
  -- |         | mouse/client buttons!
  -- |         | they are really simple, but at the same time really efficient.
  -- \________/
client.connect_signal("request::default_mousebindings", function()
	awf.mouse.append_client_mousebindings({
		awf.button({ }, 1, function (c)
			c:activate { context = "mouse_click" }
		end), 
		awf.button({ modKey }, 1, function(c)
			c:activate { context = "mouse_click", action = "mouse_move" }
		end),
		awf.button({ modKey }, 3, function(c)
			c:activate { context = "mouse_click", action = "mouse_resize" }
		end),
    awf.button({ modKey, "Shift" }, 3, function() awf.spawn('bash ' .. uvrs.rofi .. ' ' .. mouse.coords().x .. ' ' .. mouse.coords().y) end),
    awf.button({ }, 3, function()
        local srr = require('widgets.sourire')
        if not menu then
          return
        else
          awf.screen.connect_for_each_screen(rtrn)
        end
    end)
	})
end)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
