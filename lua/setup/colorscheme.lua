

local function color_config()
  vim.cmd("colorscheme tokyonight-night")
end

local function setup(use)
  use { "folke/tokyonight.nvim",
    config = color_config
  }
--  use { "olimorris/onedarkpro.nvim",
--    event = 'VimEnter',
--    config = function()
--      vim.cmd("colorscheme onedark")
--    end
--  }
end

return { setup = setup }
