
vim.cmd.packadd "packer.nvim"

-- auto compile packer plugin settings
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "plugins.lua" },
    command = "PackerCompile",
  })

require("packer").startup(function(use)
  -- packer selfhost
  use { 'wbthomason/packer.nvim', opt = true }

  -- plugins
  require("setup/treesitter").setup(use)

  require("setup/lsp").setup(use)
  require("setup/completion").setup(use)

  require("setup/colorscheme").setup(use)
  require("setup/fuzzyfinder").setup(use)
  require("setup/statusline").setup(use)
end)
