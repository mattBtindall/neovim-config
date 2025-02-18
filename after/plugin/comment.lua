local commentApi = require('Comment.api')
vim.keymap.set("n", "<C-_>", function() commentApi.toggle.linewise.current() end, { noremap = true, silent = true })
