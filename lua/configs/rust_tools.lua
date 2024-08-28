local bufnr = vim.api.nvim_get_current_buf()
vim.g.rustaceanvim = {
  ---@type rustaceanvim.tools.Opts
  tools = {
    hover_actions = {
      replace_builtin_hover = true
    }
  },
  ---@type rustaceanvim.lsp.ClientOpts
  server = {
    on_attach = function(client, bufnr)
      -- Set keybindings, etc. here.
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
    -- ...
  },
  ---@type rustaceanvim.dap.Opts
  dap = {
    -- ...
  },
}
