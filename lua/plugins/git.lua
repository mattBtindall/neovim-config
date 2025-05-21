return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", ":vertical Git | wincmd H<CR>")
            vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
            vim.keymap.set("n", "<leader>gc", ":vertical Git commit | wincmd H<CR>")
            vim.keymap.set("n", "<leader>gl", ":vertical Git log | wincmd H<CR>")
            vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
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

            vim.keymap.set("n", "<leader>gt", ":Gitsigns preview_hunk_inline<CR>", {})
            vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
        end
    }
}
