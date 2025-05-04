local builtin = require('telescope.builtin')
local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")

vim.keymap.set('n', '<leader>pf', function ()
    builtin.find_files({
        no_ignore = true
    })
end, { desc = 'Telescope find all files' })

vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files respects .gitignore'})

-- opens recent files and goes to normal mode so can scroll straight away with jk keys
vim.keymap.set('n', '<leader>pr', function()
  builtin.oldfiles({
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
    require("telescope-live-grep-args.shortcuts").grep_visual_selection()
end, { desc = "Live Grep Args (Find Selected Text)" })

vim.keymap.set("n", "<leader>ps", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('n', '<leader>ds', function ()
    local cwd = vim.fn.getcwd()
    local dir = vim.fn.expand("%:p:h")
    dir = dir:gsub("oil://", "")

    -- Normalize to remove trailing slash (if any)
    if cwd:sub(-1) == "/" then
      cwd = cwd:sub(1, -2)
    end

    local relativeDir = dir:gsub(vim.pesc(cwd), "")

    telescope.extensions.live_grep_args.live_grep_args({
        default_text = "--no-ignore -F '' -g **" .. relativeDir .. "/**",
        attach_mappings = function(_, _)
            vim.schedule(function()
                -- Move the cursor inside the single quotes
                local prompt_bufnr = vim.api.nvim_get_current_buf()
                local current_line = vim.api.nvim_get_current_line()
                local cursor_pos = current_line:find("%-F ''")

                if cursor_pos then
                    vim.api.nvim_win_set_cursor(0, {1, cursor_pos + 3})
                end
            end)
            return true
        end
    })
end, { desc = 'Telescope search in current dir' })

-- vim.fn.expand("%:p:h").gsub("oil://", "")
telescope.setup({
    defaults = {
        path_display = {"absolute"},
        wrap_results = true,
        layout_strategy = "vertical",
        winblend = 5
    }
})
telescope.load_extension("live_grep_args")

