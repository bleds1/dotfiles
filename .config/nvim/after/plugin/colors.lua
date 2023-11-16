function ColorMyPencils(color)
			color = color or "nord"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "none"})
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
            vim.api.nvim_set_hl(0, "Visual",{ bg = "#C290A0", fg = "#232323"}) 
end

ColorMyPencils()