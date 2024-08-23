function ColorMyPencils(color)
			color = color or "github_dark_dimmed"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#acacac"}) -- needed for certain themes
			 vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"}) -- needed for certain themes
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "#232323", fg = "#9da7b4"})
            vim.api.nvim_set_hl(0.,"CursorLine", { bg = "#232323"})
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#151515"}) -- needed for certain themes
            vim.api.nvim_set_hl(0, "Visual",{ bg = "#C290A0", fg = "#232323"})
            -- Change color of mode message
            vim.api.nvim_set_hl(0,"ModeMsg",{ fg = "#9da7b4" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#282828" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828" })
            vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "#282828" })
            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#232323", fg = "#9da7b4" })
            vim.api.nvim_set_hl(0, "TelescopeResult", { bg = "#282828", fg = "#9da7b4" })
            vim.cmd("hi! NvimTreeNormal guibg=#282828")
            vim.cmd("hi! WhichKeyFloat guibg=#282828")
            vim.cmd("hi! CmpDocumentation guibg=#282828")
            vim.cmd("hi! CmpDocumentationBorder guibg=#282828")
            vim.cmd("hi! CocExplorerNormalFloat guibg=#282828")
            vim.cmd("hi! ColorColumn guibg=#282828")
            vim.cmd("hi! PMenu guibg=#282828")
end

ColorMyPencils()
