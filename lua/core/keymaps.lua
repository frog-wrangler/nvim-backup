local telescope_builtin = require("telescope.builtin")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local ufo = require("ufo")
local dap = require("dap")
local dap_view = require("dap-view")


local ufo_peek = function ()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end

local alpha_open_menu = function ()
    vim.cmd("wincmd b")
    vim.cmd("Neotree close")
    require("dap-view").close()
    vim.cmd("Alpha")
end

local start_dap = function ()
    dap_view.open()
    dap.continue()
end


vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function (event)
        local options = { buffer = event.buf }

        vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", options)
        vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", options)
        vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", options)
        vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", options)
        vim.keymap.set("n", "go", ":lua vim.lsp.buf.type_definition()<CR>", options)
        vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", options)
        vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", options)
        vim.keymap.set("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", options)
        vim.keymap.set("n", "<F3>", ":lua vim.lsp.buf.code_action()<CR>", options)
        vim.keymap.set({ "i", "x", "n", "s" }, "<F4>", function ()
            vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
        end, options)
        vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function ()
            vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
            vim.cmd("write")
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        end)
    end,
})

local keys = {
    { { "i", "x", "n", "s" }, "<C-s>",            "<Esc>:w<CR>" },
    { "n",                    "<leader>pl",       ":pu<CR>" },
    { "n",                    "<leader>px",       '"+p' },
    { "t",                    "<Esc>",            "<C-\\><C-n>" },
    { "n",                    "<leader>ff",       telescope_builtin.find_files },
    { "n",                    "<leader>fs",       telescope_builtin.live_grep },
    { "n",                    "<leader>fh",       telescope_builtin.help_tags },
    { "n",                    "<leader>a",        harpoon_mark.add_file },
    { "n",                    "<C-a>",            harpoon_ui.toggle_quick_menu },
    { "n",                    "<leader>pv",       ":Neotree current .<CR>" },
    { "n",                    "<C-b>",            ":Neotree toggle=true<CR>" },
    { "n",                    "<leader>uO",       ufo.openAllFolds },
    { "n",                    "<leader>uC",       ufo.closeAllFolds },
    { "n",                    "<leader>up",       ufo_peek },
    { "n",                    "<leader><leader>", "za" },
    { "n",                    "<leader>nm",       ":Neominimap Toggle<CR>" },
    { { "i", "x", "n", "s" }, "<C-n>",            alpha_open_menu },
    { "n",                    "<leader>b",        dap.toggle_breakpoint },
    { "n",                    "<leader>e",        dap_view.add_expr },
    { "n",                    "<leader>dd",       dap_view.toggle },
    { "n",                    "<F5>",             start_dap },
    { "n",                    "<leader>?",        require("dap.ui.widgets").hover },
    { "n",                    "<leader>j",        dap.step_into },
    { "n",                    "<leader>k",        dap.step_out },
    { "n",                    "<leader>l",        dap.step_over },
    { "n",                    "<leader>h",        dap.step_back },
    { "n",                    "<leader>gg",       require("neogit").open },
}

for _, keymap in ipairs(keys) do
    if #keymap ~= 3 then
        vim.print("Error found in length of keymap:\n", keymap)
        return
    end
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
end
