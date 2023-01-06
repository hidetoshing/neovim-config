vim.cmd.packadd "packer.nvim"

-- auto compile packer plugin settings
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "plugins.lua" },
    command = "PackerCompile",
  })

require("packer").startup(function()
  -- packer
  use { 'wbthomason/packer.nvim', opt = true }

  -- fuzzy find
  use { "nvim-telescope/telescope.nvim",
    module = { "telescope" },
    requires = {
      { 'nvim-lua/plenary.nvim' },
      -- extentions
      { "nvim-telescope/telescope-ghq.nvim", opt = true },
      -- { "nvim-telescope/telescope-z.nvim", opt = true },
    },
    wants = {
      "telescope-ghq.nvim",
      -- ……
    },
    setup = function()
      local function builtin(name)
        return function(opt)
          return function()
            return require("telescope.builtin")[name](opt or {})
          end
        end
      end

      local function extensions(name, prop)
        return function(opt)
          return function()
            local telescope = require "telescope"
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
          end
        end
      end

      vim.keymap.set("n", "<leader>ff", builtin "find_files" {})
      vim.keymap.set("n", "<leader>fr", builtin "oldfiles" {})
      vim.keymap.set("n", "<Leader>f:", builtin "command_history" {})
      vim.keymap.set("n", "<Leader>fb", builtin "buffers" {})
      vim.keymap.set("n", "<Leader>fg", builtin "live_grep" {})
      vim.keymap.set("n", "<Leader>fG", builtin "grep_string" {})
      vim.keymap.set("n", "<Leader>fm", builtin "man_pages" { sections = { "ALL" } })
      vim.keymap.set("n", "<Leader>f?", builtin "keymaps" {})
      vim.keymap.set("n", "<Leader>fq", extensions("ghq", "list") {})
      -- develop
      vim.keymap.set("n", "<Leader>ft", builtin "treesitter" {})
    end,
    config = function()
      require("telescope").setup {
        -- 様々な設定
      }
    end
  }

  -- UI
  use { "olimorris/onedarkpro.nvim",
    event = 'VimEnter',
    config = function()
      vim.cmd("colorscheme onelight")
    end
  }
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'onelight',
        }
      }
    end
  }

  -- for dev
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/nvim-treesitter-textobjects',
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      }
    end
  }
  use { "yioneko/nvim-yati",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup {
        yati = {
          enable = true,
          -- Disable by languages, see `Supported languages`
          disable = {  },

          -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
          default_lazy = true,

          -- Determine the fallback method used when we cannot calculate indent by tree-sitter
          default_fallback = "auto"
        },
        indent = {
          enable = false -- disable builtin indent module
        }
      }
    end
  }

  -- filetypes
  use { 'fatih/vim-go',
    opt = true,
    ft = { 'go' }
  }
end)