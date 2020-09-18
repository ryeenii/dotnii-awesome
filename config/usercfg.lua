local vrs = require('config.defcfg')
return {
  themeDir = vrs.themeDir, -- full directory or integrated with cfgDir
  iconDir = vrs.iconDir, -- full directory or integrated with cfgDir
  pfpDir = vrs.pfpDir, -- full directory or integrated with cfgDir
  userName = vrs.userName, -- text
  rofiEmoji = vrs.rofiEmoji, -- short/full directory or integrated with cfgDir
  rofiRun = vrs.rofiRun, -- short/full directory or integrated with cfgDir
  rofi = vrs.rofi, -- short/full directory or integrated with cfgDir
  scr = vrs.scr, -- short/full directory or integrated with cfgDir
  scrDelay = vrs.scrDelay, -- short/full directory or integrated with cfgDir
  str = vrs.str, -- short/full directory or integrated with cfgDir
  downDir = vrs.downDir, -- full directory
  docsDir = vrs.docsDir, -- full directory
  msicDir = vrs.msicDir, -- full directory
  picsDir = vrs.picsDir, -- full directory
  vidsDir = vrs.vidsDir, -- full directory
  repoDir = vrs.repoDir, -- full directory
  searchDDG = vrs.searchDDG, -- TODO: remove the search and launch queries for a more efficient array-based method
  searchARW = vrs.searchARW,
  launchSTM = vrs.launchSTM
}
