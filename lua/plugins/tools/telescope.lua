return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function ()
        local opts = {
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                preview = {
                    treesitter = false,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        specific_opts = {
                            codeactions = false,
                        },
                    }),

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function (items) -> indexed_items, width,
                    --     make_displayer = function (widths) -> displayer
                    --     make_display = function (displayer) -> function (e)
                    --     make_ordinal = function (e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                },
            },
        }

        require("telescope").setup(opts)
        require("telescope").load_extension("ui-select")
    end,
}
