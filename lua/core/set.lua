vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.o.nu = true
vim.o.rnu = true

-- Tabs and tabstop
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Folding config w/ufo
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.wrap = false

-- Epub
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.epub" },
    callback = function(args)
        local bufName = vim.api.nvim_buf_get_name(args.buf)
        print("Buffer Name is " .. bufName)
        if bufName == "" then return end

        require("epub").open_epub(bufName)
    end,
})

-- Search options
vim.o.hlsearch = false
vim.o.incsearch = true

-- diagnostics
vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true } })

-- other
vim.o.scrolloff = 5
vim.o.signcolumn = "yes"
vim.o.updatetime = 50
