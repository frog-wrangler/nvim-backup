vim.treesitter.language.add(
    "latex",
    { path = "/home/FrogWrangler/.local/share/tree-sitter/tree-sitter-latex/latex.so" }
-- TODO fix this shit
)
vim.treesitter.language.register("latex", "latex")

vim.treesitter.language.add(
    "html",
    { path = "/home/FrogWrangler/.local/share/tree-sitter/tree-sitter-html/html.so" }
)
vim.treesitter.language.register("html", "html")
