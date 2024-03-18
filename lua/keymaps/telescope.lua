local builtin = require('telescope.builtin')
local grep_opts = {
    prompt = 'Grep project',
}

return {
    {
        "<leader>ff",
        "<cmd>Telescope find_files<CR>",
        desc = "Find file",
        mode = "n",
    },
    {
        "<leader>fs",
        function()
            vim.ui.input(grep_opts, function(text)
                if text ~= nil then
                    builtin.grep_string({ search = text })
                end
            end)
        end,
        desc = "Grep files",
        mode = "n",
    },
}
