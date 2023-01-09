
local function setup(use)
  use { "olimorris/onedarkpro.nvim",
    event = 'VimEnter',
    config = function()
      vim.cmd("colorscheme onelight")
    end
  }
end

return { setup = setup }