local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
[[                               __                ]],
[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  dashboard.button("p", " " .. " GFS: Mathematisches Design", ":e ~/documents/10-19_Schule/11-GMT/11.03_J2-1/main.tex <CR>"),
  dashboard.button("g", " " .. " GFS: Capital Distribution", ":e ~/documents/10-19_Schule/19-Englisch/gfs/main.tex <CR>"),
  dashboard.button("d", " " .. " Blog: Dactyl", ":e ~/repos/page/content/dactyl.md <CR>"),

  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  --dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/lua/folder/packer.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "go to work"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
