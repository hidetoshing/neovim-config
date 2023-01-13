
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
      set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope find file" })
      set("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end, { desc = "Telescope old file" })
      set("n", "<leader>f:", function() require("telescope.builtin").commands() end, { desc = "Telescope command" })
      set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Telescope buffer" })
      set("n", "<leader>bb", function() require("telescope.builtin").buffers() end, { desc = "Telescope buffer" }) -- alias
      set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope live grep" })
      set("n", "<leader>fG", function() require("telescope.builtin").grep_string() end, { desc = "Telescope grep" })
      set("n", "<leader>f?", function() require("telescope.builtin").man_pages({ sections = { "ALL" } }) end, { desc = "Telescope manual page" })
      set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Telescope keymap" })
      -- TreeSitter
      set("n", "<leader>ts", function() require("telescope.builtin").treesitter() end, { desc = "Telescope treesitter" })
      -- LSP
      set("n", "<leader>lr", function() require("telescope.builtin").lsp_references() end, { desc = "Telescope LSP references" })
      set("n", "<leader>lci", function() require("telescope.builtin").lsp_incoming_calls() end, { desc = "Telescope LSP incoming calls" })
      set("n", "<leader>lco", function() require("telescope.builtin").lsp_outgoing_calls() end, { desc = "Telescope LSP outgoing calls" })
      -- set("n", "<leader>li", function() require("telescope.builtin").lsp_implementations() end, { desc = "Telescope LSP implementations" })
      -- set("n", "<leader>ld", function() require("telescope.builtin").lsp_definitions() end, { desc = "Telescope LSP definitions" })
      -- set("n", "<leader>lt", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "Telescope LSP type definitions" })
    end,
    config = function()
      require("telescope").setup {
        -- settings
      }
    end
  }
end

return { setup = setup }