local statuscolumn = {}

statuscolumn.getColumn = function ()
    statuscolumn.setHl()

    return table.concat({
        "%s%=",
        statuscolumn.number(),
        statuscolumn.border()
    })
end

statuscolumn.setHl = function ()
    vim.api.nvim_set_hl(0, "BorderColor", { fg = vim.api.nvim_get_hl(0, { name = "lualine_a_normal" }).bg })
end

statuscolumn.number = function ()
    return vim.v.relnum == 0 and "%#BorderColor#" .. vim.v.lnum or vim.v.relnum
end

statuscolumn.border = function ()
    return " %#BorderColor#┆ "
end

return statuscolumn
