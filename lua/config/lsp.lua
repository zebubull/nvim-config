-- local mason = require('mason')
-- local mason_lspconfig = require('mason-lspconfig')

-- mason.setup()

-- mason_lspconfig.setup({
--     ensure_installed = {
--         'lua_ls',
--         'clangd',
--         'rust-analyzer',
--         'jdtls',
--         'zls'
--     }
-- })

local lspsaga = require('lspsaga')

lspsaga.setup({
    move_in_saga = { prev = '<C-k>', next = '<C-j>' },
    finder_action_keys = { open = '<CR>' },
    definition_action_keys = { edit = '<CR>' },
})

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local keymap = vim.keymap

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "[D", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>LSOutlineToggle<CR>", opts)
end

-- used for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["zls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["jdtls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            }
        }
    }
})