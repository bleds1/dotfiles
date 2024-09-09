function ColorMyPencils(color)
			color = color or "github_dark_dimmed"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#acacac"}) -- needed for certain themes
			 vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"}) -- needed for certain themes
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1D1F2A", fg = "#9da7b4"})
            vim.api.nvim_set_hl(0.,"CursorLine", { bg = "#212431"})
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#151515"}) -- needed for certain themes
            vim.api.nvim_set_hl(0, "Visual",{ bg = "#C290A0", fg = "#1D1F2A"})
            -- Change color of mode message
            vim.api.nvim_set_hl(0,"ModeMsg",{ fg = "#9da7b4" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1D1F2A" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1D1F2A" })
            vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "#1D1F2A" })
            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#1D1F2A", fg = "#9da7b4" })
            vim.api.nvim_set_hl(0, "TelescopeResult", { bg = "#1D1F2A", fg = "#9da7b4" })
            vim.cmd("hi! NvimTreeNormal guibg=#303446")
            vim.cmd("hi! WhichKeyFloat guibg=#303446")
            vim.cmd("hi! CmpDocumentation guibg=#303446")
            vim.cmd("hi! CmpDocumentationBorder guibg=#303446")
            vim.cmd("hi! CocExplorerNormalFloat guibg=#303446")
            vim.cmd("hi! ColorColumn guibg=#303446")
            vim.cmd("hi! PMenu guibg=#303446")
end

ColorMyPencils()
