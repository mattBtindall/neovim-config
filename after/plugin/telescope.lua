local builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- find all files including node_modules
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- find nly files that are tracked by git

-- opens recent files and goes to normal mode so can scroll straight away with jk keys
vim.keymap.set('n', '<leader>pr', function()
  require('telescope.builtin').oldfiles({
    cwd_only = true,
    attach_mappings = function(_, map)
      -- Immediately switch to normal mode when the picker opens
      vim.schedule(function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'n', false)
      end)
      return true
    end,
  })
end, { desc = "Recent files in project (normal mode)" })

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

telescope.setup({
    defaults = {
        path_display = {
            "truncate"
        }
    }
})
telescope.load_extension("live_grep_args")

