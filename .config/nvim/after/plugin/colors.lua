function ColorMyPencils(color)
			color = color or "github_dark_dimmed"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "#282828"}) -- needed for certain themes
			 vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828"}) -- needed for certain themes
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282828", fg = "#9da7b4"})
            vim.api.nvim_set_hl(0.,"CursorLine", { bg = "#232323"})
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#151515"}) -- needed for certain themes
            vim.api.nvim_set_hl(0, "Visual",{ bg = "#C290A0", fg = "#232323"})
            -- Change color of mode message
            vim.api.nvim_set_hl(0,"ModeMsg",{ fg = "#9da7b4" })
end

ColorMyPencils()
