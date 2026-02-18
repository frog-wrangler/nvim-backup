local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    rocks = { enabled = false },
    spec = {
        { import = "plugins.UI" },
        { import = "plugins.tools" },
        { import = "plugins.lsp" },
    },
    change_detection = {
        notify = false,
    },
    ui = {
        icons = {
            cmd = " ",
            config = " ",
            event = " ",
            favorite = " ",
            ft = " ",
            init = " ",
            import = "󰋺 ",
            keys = " ",
            lazy = " ",
            loaded = " ",
            not_loaded = " ",
            plugin = "󰆧 ",
            runtime = " ",
            require = " ",
            source = " ",
            start = " ",
            task = " ",
            list = {
                " ",
                " ",
                " ",
                "- ",
            },
        },
    },
})
