local awf = require("awful")
local rld = require("ruled")
local btf = require("beautiful")
local kys = require("keys")
rld.client.connect_signal("request::rules", function()
	rld.client.append_rule {
		id = "main",
		rule = { },
		properties = {
			focus = awf.client.focus.filter,
			raise = true,
			screen = awf.screen.focused,
			placement = awf.placement.no_overlap+awf.placement.no_offscreen
		}
	}
	rld.client.append_rule {
		id = "floating",
		rule_any = {
			instance = {
				"copyq",
				"floating_terminal",
				"Devtools", 
				"multimc", 
				"steam"
			},
			class = {
				"Gpick",
				"Lxappearance",
				"Nm-connection-editor",
				"File-roller",
				"fst"
			},
			role = {
				"AlarmWindow",
				"pop-up",
				"GtkFileChooserDialog",
				"conversation"
			},
			type = {"dialog"}
		},
		properties = { floating = true }
		}
end)
