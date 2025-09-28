vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<leader>pl", ":pu<CR>")
vim.keymap.set("n", "<leader>px", '"+p')

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")


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

-- minimap
-- TODO

-- alpha
vim.keymap.set({ "i", "x", "n", "s" }, "<C-n>", function()
    vim.cmd("wincmd b")
    vim.cmd("Neotree close")
    require("dap-view").close()
    vim.cmd("Alpha")
end)


-- nvim-dap
local dap = require("dap")
local dap_view = require("dap-view")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>e", dap_view.add_expr)
vim.keymap.set("n", "<leader>dd", function()
    dap_view.toggle()
end)
vim.keymap.set("n", "<F5>", function()
    dap_view.open()
    dap.continue()
end)
vim.keymap.set("n", "<leader>?", function()
    require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>j", dap.step_into)
vim.keymap.set("n", "<leader>k", dap.step_out)
vim.keymap.set("n", "<leader>l", dap.step_over)
vim.keymap.set("n", "<leader>h", dap.step_back)


-- neogit
vim.keymap.set("n", "<leader>gg", function()
    require("neogit").open()
end)


-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local options = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
        vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
        vim.keymap.set({ "i", "x", "n", "s" }, "<F4>", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
        end, options)
        vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
            vim.cmd("write")
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        end)
    end,
})
