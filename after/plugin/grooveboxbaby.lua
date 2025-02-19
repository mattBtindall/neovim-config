-- Enable telescope theme
-- vim.g.gruvbox_baby_telescope_theme builtin= 1
-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]

-- set the current line number to bold yellow
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#564E48', bold=false })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#EEBD35', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#564E48', bold=false })
