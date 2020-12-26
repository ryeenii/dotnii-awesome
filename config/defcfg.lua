--        __     __   __
-- ||   //  \\ //   //  \\ ||
-- ||   ||  || ||   ||--|| ||   most commonly used variables
-- \\__ \\__// \\__ ||  || \\__ helps keep the code fresh and clean!
--
local grs = require('gears')
cfgDir = grs.filesystem.get_configuration_dir()
return {
  --_________
  --  ___   _\
  -- /   \  \_ (there was an attempt on drawing this icon)
  -- |   |   _| Settings
  -- \___/  /_  most of this remains intact, but feel free to alter as you like.
  -- ________/
  --
  themeDir = cfgDir .. "theme/",
  iconDir = cfgDir .. "icon/",
  pfpDir = cfgDir .. "icon/reenii.png", -- here, you change the profile pic!
  userName = os.getenv("USER") or "User",

  -- {{
  -- below are the scripts used alongside the WM (such as rofi and maim).
  -- they are used for multiple reasons in keys.lua, so if you want to exclude
  -- anything from this section you might want to remove the keybind related to it
  -- as well.
  -- }}
  rofiEmoji = cfgDir .. "scripts/rofi-emoji.sh",
  rofiRun = cfgDir .. "scripts/rofi-run.sh",
  rofi = cfgDir .. "scripts/rofi.sh",
  scr = cfgDir .. "scripts/scr.sh",
  scrDelay = cfgDir .. "scripts/scr-delay.sh",
  str = cfgDir .. "scripts/str.sh",
  --   ___
  -- //   \\______
  -- ||           || down there goes the directories, used in the widgets (still TBA).
  -- ||           || feel free to change these as you prefer.
  -- ||           || once again, if there is any additional property you would like to include,
  -- \\___________// ensure that you enable it in it's respective module.
  downDir = os.getenv("XDG_DOWNLOAD_DIR") or "~/Downloads/",
  docsDir = os.getenv("XDG_DOCUMENTS_DIR") or "~/Documents/",
  msicDir = os.getenv("XDG_MUSIC_DIR") or "~/Music/",
  picsDir = os.getenv("XDG_PICTURES_DIR") or "~/Pictures/",
  vidsDir = os.getenv("XDG_VIDEOS_DIR") or "~/Videos/",
  repoDir = "~/Documents/Repos",
  --   ______
  -- //  __  \\
  -- || /  \ || search engines used in the widgets (TBA)
  -- || \__/ || same scheme as the other ones,
  -- \\__  _//  edit the modules if you are gonna add something.
  --    \\ \\
  --     \\_\\
  searchDDG = "xdg-open https://duckduckgo.com/?q=",
  searchARW = "xdg-open https://wiki.archlinux.org/index.php?search=",
  launchSTM = "xdg-open steam://rungameid/",
}
