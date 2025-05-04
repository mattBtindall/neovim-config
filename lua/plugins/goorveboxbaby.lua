return {
    'luisiacc/gruvbox-baby',
    config = function()
        -- Enable telescope theme
        vim.g.gruvbox_baby_telescope_theme = 1
        -- Enable transparent mode
        vim.g.gruvbox_baby_transparent_mode = 1

        -- Load the colorscheme
        vim.cmd[[colorscheme gruvbox-baby]]

        -- Set background colour
        vim.api.nvim_set_hl(0, "Normal", { bg = "#32302F" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#32302F" })

        -- set the current line number to bold yellow
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#564E48', bold=false })
        vim.api.nvim_set_hl(0, 'LineNr', { fg='#EEBD35', bold=true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#564E48', bold=false })

        -- set tab indent line colour
        -- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#4a4746" })
        vim.api.nvim_set_hl(0, "NonText", { fg = "#3b3837" })

        -- vim.cmd [[highlight StatusLine guibg=#282c34 guifg=#ffffff]]
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#32302F", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#32302F", fg = "#ffffff" })
    end
}

