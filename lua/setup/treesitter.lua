
local function setup(use)
  use { 'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead' },
    run = ':TSUpdate',
    requires = {
      -- plugins
      { 'RRethy/nvim-treesitter-endwise', opt = true },
      { 'nvim-treesitter/nvim-treesitter-textobjects', opt = true },
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
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
end

return { setup = setup }