return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        pickers = {
            find_files = {
                theme = "dropdown",
            },
        },
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
            },
        },
    }
}
