--  _____
--//_____\\
--||  |  ||
--||  |  || Beautiful thm
--||  |  || ...doesn't necessarily means it's Beautiful.
--||  |  || Beautiful is the library name.
--||  |  || but who knows? maybe it is Beautiful.
--||__|__|| :^)
--\\#####//
-- \\###//
--  \\_//

local thmAssets = require("beautiful.theme_assets")
local xrsrc = require("beautiful.xresources")
local xrdb = xrsrc.get_current_theme()
local dpi = xresources.apply_dpi
local vars = require("vars")
local thm = {}

thm.font          = "Roboto Mono Nerd Font 8"

thm.bg_normal     = xrdb.background or "#111111"
thm.bg_focus      = xrdb.color3 or "#d2504e"
thm.bg_urgent     = xrdb.color3 or "#ff0000"
thm.bg_minimize   = xrdb.color5 or "#444444"
thm.bg_systray    = thm.bg_normal

thm.fg_normal     = thm.bg_focus
thm.fg_focus      = thm.bg_normal
thm.fg_urgent     = thm.bg_normal
thm.fg_minimize   = thm.bg_focus

thm.useless_gap   = 4
thm.gap_single_client  = true
thm.border_width  = dpi(2)
thm.border_normal = thm.bg_normal
thm.border_focus  = thm.bg_focus
thm.border_marked = thm.bg_minimize

local taglist_square_size = dpi(4)
thm.taglist_squares_sel = thm_assets.taglist_squares_sel(
    taglist_square_size, thm.fg_normal
)
thm.taglist_squares_unsel = thm_assets.taglist_squares_unsel(
    taglist_square_size, thm.fg_normal
)

thm.notification_font = "Roboto Mono Nerd Font 10"
thm.notification_bg = thm.bg_normal
thm.notification_fg = thm.fg_normal
thm.notification_width = dpi(10)
thm.notification_height = dpi(12)
thm.menu_submenu_icon = iconDir .. "reenii.png"
thm.menu_height = dpi(15)
thm.menu_width  = dpi(100)
thm.menu_border_color = thm.border_normal
thm.menu_border_width = thm.border_width

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--thm.bg_widget = "#cc0000"

-- Define the image to load
thm.titlebar_close_button_normal = iconDir.."titlebar/close_normal.png"

thm.titlebar_minimize_button_normal = iconDir.."titlebar/minimize_normal.png"

thm.titlebar_ontop_button_normal_inactive = iconDir.."titlebar/ontop_normal_inactive.png"
thm.titlebar_ontop_button_normal_active = iconDir.."titlebar/ontop_normal_active.png"

thm.titlebar_sticky_button_normal_inactive = iconDir.."titlebar/sticky_normal_inactive.png"
thm.titlebar_sticky_button_normal_active = iconDir.."titlebar/sticky_normal_active.png"

thm.titlebar_floating_button_normal_inactive = iconDir.."titlebar/floating_normal_inactive.png"
thm.titlebar_floating_button_normal_active = iconDir.."titlebar/floating_normal_active.png"

thm.titlebar_maximized_button_normal_inactive = iconDir.."titlebar/maximized_normal_inactive.png"
thm.titlebar_maximized_button_normal_active = iconDir.."titlebar/maximized_normal_active.png"

thm.wallpaper = "/home/reenii/Pictures/Wallpapers/walliowall.jpg"

-- layout icons!
thm.layout_floating  = iconDir.."layouts/floatingw.png"
thm.layout_tileleft   = iconDir.."layouts/tileleftw.png"
thm.layout_tile = iconDir.."layouts/tilew.png"

-- Define the icon thm for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
thm.icon_thm = "McMojave-circle"

return thm

