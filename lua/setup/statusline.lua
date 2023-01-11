

local function setup(use)
  use { 'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = function()
      local navic = require("nvim-navic")

      require('lualine').setup {
        options = {
          theme = 'onelight',
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'filename', 'branch', 'diff'},
          lualine_c = {{ navic.get_location, cond = navic.is_available }},
          lualine_x = {'diagnostics', 'filetype', 'encoding', 'fileformat'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        tabline = {
          lualine_a = {'hostname'},
          lualine_b = {'buffers'},
          lualine_c = {'filename'},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
        },
      }
    end
  }
end

return { setup = setup }