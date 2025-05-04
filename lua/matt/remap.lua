vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set(
--     "n",
--     "<leader>ee",
--     "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
-- )

-- vim.keymap.set(
--     "n",
--     "<leader>ea",
--     "oassert.NoError(err, \"\")<Esc>F\";a"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>ef",
--     "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>el",
--     "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
-- )

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- my custom mappings
-- save and close
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "QuitPre" }, {
    callback = function()
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
              vim.api.nvim_command('silent update')
        end
    end,
})
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy absolute file path to clipboard" })

vim.keymap.set("n", "<leader>yf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy the file name to clipboard" })

vim.keymap.set("n", "<leader>yr", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copu the relative file path to clipboard" })

vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Run Gdiffsplit" })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        if vim.v.operator == "y" and vim.fn.mode() ~= "v" and vim.fn.mode() ~= "V" then
            vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
        end
    end
})

vim.keymap.set("n", "<leader>td", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })

vim.keymap.set("n", "<leader>c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set('n', '<leader>sf', function()
  local word = vim.fn.expand("<cword>") -- Get word under cursor
  vim.cmd("normal! /" .. word .. "\\<CR>") -- Search for it
end, { desc = "Search current word in file", silent = true })

vim.keymap.set('v', '<leader>z', function()
  vim.cmd('normal! "zy')  -- Yank selection into register z
  vim.cmd('execute "normal! /" . @z . "\\<CR>"') -- Search using register z
end)

vim.keymap.set("n", "<CR>", ":noh<CR>", { noremap = true, silent = true })

-- opens file explorer in current directory
vim.keymap.set('n', '<leader>e', function()
  local dir = vim.fn.expand("%:p:h")
  local cleanDir = dir:gsub("oil://", "")
  vim.fn.jobstart({ "xdg-open", cleanDir }, { detach = true })
end)

