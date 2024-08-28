local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

local protocol = require("vim.lsp.protocol")

local util = require "lspconfig/util"
local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- No need to setup rust lsp because it has been configured in rusttools
--[[
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
}) ]]
