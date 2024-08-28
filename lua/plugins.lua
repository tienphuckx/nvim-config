-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- Common utilities
  use("nvim-lua/plenary.nvim")

  -- Icons
  use({
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("configs.web_dev_icons")
    end,
  })

  -- Colorschema
  use("rebelot/kanagawa.nvim")

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("configs.lualine")
    end,
    requires = { "nvim-web-devicons" },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("configs.treesitter")
    end,
  })

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })


  -- vscode-like pictograms to neovim built-in lsp
  use("onsails/lspkind-nvim")
  -- Snippet Engine for Neovim written in Lua
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*",
  })

  -- cmp: Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("configs.cmp")
    end,
  })

  use("hrsh7th/cmp-nvim-lsp")

  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

  -- LSP diagnostics, code actions, and more via Lua.
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Mason: Portable package manager
  use({
    "williamboman/mason.nvim"
  })
  require("mason").setup()
  --Mason LSP configurations
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lsp")
    end,
    requires = {
      "williamboman/mason.nvim"
    }
  })

  -- nvim LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lsp")
    end,
  })

  -- File manager
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })

  -- Show colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("configs.toggleterm")
    end,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
  })

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })


  -- Auto pairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
  })

  -- Background Transparent
  use({
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },
        exclude_groups = {}
      })
    end,
  })
  -- Comment
  use({
    'numToStr/Comment.nvim',
    config = function()
      require("configs.comment")
    end
  })

  -- tab bar
  use({
    "romgrk/barbar.nvim"
  })

  -- Debugging
  use({ "nvim-neotest/nvim-nio" })
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })
  require("configs.dap")
  use({
    'lvimuser/lsp-inlayhints.nvim',
    config = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      require("lsp-inlayhints").setup()
    end
  })
  -- rust tools	
  use({
    "mrcjkb/rustaceanvim",
    config = function()
      require("configs.rust_tools")
    end,
  })
end)
