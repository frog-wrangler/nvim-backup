vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<leader>pl", ":pu<CR>")
vim.keymap.set("n", "<leader>px", '"+p')

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("v", "<C-g>", ":norm gc<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-a>", ui.toggle_quick_menu)

-- neo-tree
vim.keymap.set("n", "<leader>pv", ":Neotree current .<CR>")
vim.keymap.set("n", "<C-b>", ":Neotree toggle=true<CR>")

-- ufo-folding
local ufo = require("ufo")
vim.keymap.set("n", "<leader>uO", ufo.openAllFolds)
vim.keymap.set("n", "<leader>uC", ufo.closeAllFolds)
vim.keymap.set("n", "<leader>up", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)
vim.keymap.set("n", "<leader><leader>", "za")

-- alpha
vim.keymap.set({ "i", "x", "n", "s" }, "<C-n>", function()
    vim.cmd("wincmd b")
    vim.cmd("Neotree close")
    vim.cmd("Alpha")
end)

-- nvim-dap
local dap = require("dap")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)
vim.keymap.set("n", "<leader>c", dap.continue)
vim.keymap.set("n", "<leader>j", dap.step_into)
vim.keymap.set("n", "<leader>k", dap.step_out)
vim.keymap.set("n", "<leader>l", dap.step_over)
vim.keymap.set("n", "<leader>h", dap.step_back)
