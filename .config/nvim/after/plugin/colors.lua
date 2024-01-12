require('rose-pine').setup({
  disable_background = true
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

function Transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

-- Color schemes
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme papercolor')
-- vim.cmd('colorscheme catppuccin')
-- vim.cmd('colorscheme nightfly')
-- vim.cmd('colorscheme tokyonight-moon')
-- vim.cmd('colorscheme onedark')
vim.cmd('colorscheme dracula')
--
-- vim.cmd('colorscheme gruvbox')

Transparent()

