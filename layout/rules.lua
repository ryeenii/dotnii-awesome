local awf = require("awful")
local btf = require("beautiful")
local kys = require("keys")
awf.rules.rules = {
    {
        rule = { },
        properties = {
            border_width = btf.border_width,
            border_color = btf.border_color,
            focus = awf.client.focus.filter,
            raise = true,
            keys = clkeys,
            buttons = clbuttons,
            screen = awf.screen.focused,
            placement = awf.placement.no_overlap+awf.placement.no_offscreen
        }
    },
    {
        rule_any = {
            instance = {"copyq","floating_terminal","Devtools"},
            class = {"Gpick","Lxappearance","Nm-connection-editor","File-roller","fst", "steam"},
            role = {"AlarmWindow","pop-up","GtkFileChooserDialog","conversation"},
            type = {"dialog"}
        },
        properties = { floating = true }
    }
}
