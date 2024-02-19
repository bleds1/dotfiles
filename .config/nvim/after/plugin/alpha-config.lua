local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[     █  █     ]],
    [[     ██ ██     ]],
    [[     █████     ]],
    [[     ██ ███     ]],
    [[     █  █     ]],
    [[]],
    [[N  E  O   V  I  M]],

}

 dashboard.section.buttons.val = {
   dashboard.button("f f", "  Find file", ":Telescope find_files <CR>"),
   -- dashboard.button("e n", "  Edit new file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("t d", "  Todo", ":split ~/vault/todo.md<CR>"),
   dashboard.button("o d", "󱓧  Daily note", ":ObsidianToday<CR>"),
   dashboard.button("g .",  "  dotfiles", ":e ~/dotfiles/<CR>"),
   dashboard.button("s o", "󰧑  Search vault", ":ObsidianSearch<CR>"),
   dashboard.button("f r", "  Recent files", ":Telescope oldfiles <CR>"),
   dashboard.button("f g", "  Grep Project", ":Telescope live_grep <CR>"),
   -- dashboard.button("rs", "󰈚  Restore Session", ":SessionRestore<cr>"),
   dashboard.button("q  ",  "󰿅  Quit", ":qa<CR>"),
}

local function footer()
 return "Welcome back Bledley..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "markdownH1"
dashboard.section.header.opts.hl = "markdownH1"
dashboard.section.buttons.opts.hl = "markdownH1"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

