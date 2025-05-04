return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
            vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function()
                    vim.cmd("highlight GitSignsAdd guifg=#B9BA33")
                    vim.cmd("highlight GitSignsDelete guifg=#F94C3A")
                end
            })

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", {})
            vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
        end
    }
}
