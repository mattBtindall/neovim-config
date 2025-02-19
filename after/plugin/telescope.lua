local builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- find all files including node_modules
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- find nly files that are tracked by git

vim.keymap.set("v", "<leader>ps", function()
  -- Get the selected text in visual mode
  local function get_visual_selection()
    vim.cmd('noau normal! "vy"') -- Yank selection into register v
    return vim.fn.getreg('v') -- Get the yanked text
  end

  local selected_text = get_visual_selection()

  -- Call live_grep_args with the selected text
  require("telescope").extensions.live_grep_args.live_grep_args({ default_text = selected_text })
end, { desc = "Live Grep Args (Find Selected Text)" })

vim.keymap.set("n", "<leader>ps", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

telescope.setup({})
telescope.load_extension("live_grep_args")

