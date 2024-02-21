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
   dashboard.button("f f", "  Find file", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git<CR>"),
   -- dashboard.button("e n", "  Edit new file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("f r", "  Recent files", ":Telescope oldfiles <CR>"),
   dashboard.button("n n", "  New Obsidian note", ":ObsidianNew<CR>"),
   dashboard.button(", ,", "󱓧  Log", ":e ~/vault/log.md<CR>"),
   dashboard.button("t d", "  Todo", ":split ~/vault/todo.md<CR>"),
   -- dashboard.button("g .",  "  Dotfiles", ":e ~/dotfiles/<CR>"),
   dashboard.button("s o", "󰧑  Search vault", ":ObsidianSearch<CR>"),
   dashboard.button("f g", "󱩾  Grep Project", ":Telescope live_grep <CR>"),
   dashboard.button("g s", "󰊤  Git Status", ":Git<CR>"),
   dashboard.button("SPC 󰌑 ", "  Bookmarks", "<leader><CR>"),
   -- dashboard.button("rs", "󰈚  Restore Session", ":SessionRestore<cr>"),
   dashboard.button("SPC q",  "󰗼  Quit", ":qa<CR>"),
}

local function footer()
 return "Welcome back Bledley..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "DevIconCP"
dashboard.section.header.opts.hl = "DevIconCP"
dashboard.section.buttons.opts.hl = "DevIconCP"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

