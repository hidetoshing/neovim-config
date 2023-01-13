
local function setup(use)
  use { "nvim-telescope/telescope.nvim",
    module = { "telescope" },
    cmd = { "Telescope" },
    requires = {
      { 'nvim-lua/plenary.nvim' },
      -- extentions
      { "nvim-telescope/telescope-ghq.nvim", opt = true },
    },
    wants = {
      "telescope-ghq.nvim",
    },
    setup = function()
      local set = vim.keymap.set
      -- keymaps
      set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope find-file" })
      set("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end)
      set("n", "<leader>f:", function() require("telescope.builtin").command_history() end)
      set("n", "<leader>fb", function() require("telescope.builtin").buffers() end)
      set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end)
      set("n", "<leader>fG", function() require("telescope.builtin").grep_string() end)
      set("n", "<leader>f?", function() require("telescope.builtin").man_pages({ sections = { "ALL" } }) end)
      set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end)
      set("n", "<leader>ft", function() require("telescope.builtin").treesitter() end)
    end,
    config = function()
      require("telescope").setup {
        -- settings
      }
    end
  }
end

return { setup = setup }