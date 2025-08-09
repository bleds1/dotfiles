function ColorMyPencils(color)
			color = color or "adwaita"
			vim.cmd.colorscheme(color)
			-- vim.api.nvim_set_hl(-1, "Normal", { bg = "#1c1c1c", fg = "#c4c4c4"})-- needed for certain themes
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"}) -- needed for certain themes
			-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1c1c1c", fg = "#666666"})
             -- vim.api.nvim_set_hl(0.,"CursorLine", { bg = "#343434"})
            -- vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none', fg = "#292929" })
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#151515"}) -- needed for certain themes
            vim.api.nvim_set_hl(0, "Visual",{ bg = "#ecc9c6"})
            vim.api.nvim_set_hl(0,"ModeMsg",{ fg = "#666666" })
            -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })
            -- vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "#000000" })
            -- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#000000", fg = "#9da7b4" })
            -- vim.api.nvim_set_hl(0, "TelescopeResult", { bg = "#000000", fg = "#9da7b4" })
            -- vim.cmd("hi! WhichKeyFloat guibg=#000000")
            -- vim.cmd("hi! CmpDocumentation guibg=#000000")
            -- vim.cmd("hi! CmpDocumentationBorder guibg=#000000")
            -- vim.cmd("hi! CocExplorerNormalFloat guibg=#000000")
            -- vim.cmd("hi! ColorColumn guibg=#000000")
            -- vim.cmd("hi! PMenu guibg=#000000")
            --- italic comments and colour (terminal & font must be capable)
            -- vim.api.nvim_set_hl(0, 'Comment', { italic=true, fg = "#555555" })
end

ColorMyPencils()
