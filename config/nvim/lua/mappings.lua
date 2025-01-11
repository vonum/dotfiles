-- Treat long lines as separate lines
vim.keymap.set("", "j", "gj")
vim.keymap.set("", "k", "gk")

-- Splits
vim.keymap.set("n", "<leader>v", ":vs<cr>", { silent = true })
vim.keymap.set("n", "<leader>h", ":split<cr>", { silent = true })

-- Easier navigation between split windows CTRL + { h, j, k, l }
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Faster saving and exiting
vim.keymap.set("n", "<leader>q", ":q!<cr>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w!<cr>", { silent = true })
vim.keymap.set("n", "<leader>x", ":x<cr>", { silent = true })
vim.keymap.set("n", "<leader>Q", ":qa!<cr>", { silent = true })
vim.keymap.set("n", "<leader>W", ":wa!<cr>", { silent = true })
vim.keymap.set("n", "<leader>X", ":xa<cr>", { silent = true })

-- Switch to alternate file
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Indent visual selected code without unselecting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", "=", "=gv")

-- Clear search highlighting
vim.keymap.set("n", "<leader><cr>", ":nohl<cr>", { silent = true })
