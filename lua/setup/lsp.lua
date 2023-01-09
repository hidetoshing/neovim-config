
local function setup(use)
  use { 'williamboman/mason.nvim',
    requires = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'neovim/nvim-lspconfig' },
      { 'SmiteshP/nvim-navic' },
      { 'folke/trouble.nvim',
        cmd = { 'Trouble', 'TroubleToggle' },
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
          require("trouble").setup {
            -- your configuration comes here
            use_diagnostic_signs = true
          }
        end
      },
    },
    config = function()
      require("mason").setup()
      require('mason-lspconfig').setup_handlers({ function(server)
        local opt = {
        }
        local navic = require("nvim-navic")
        require('lspconfig')[server].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = function(client, bufnr)
            local set = vim.keymap.set
            -- keymaps
            set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
            set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
            set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
            set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
            set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
            set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
            set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
            set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
            set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
            set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
            set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
            set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
            set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
            set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
            if client.server_capabilities.documentSymbolProvider then
              navic.attach(client, bufnr)
            end
          end
        })
      end })
    end
  }

end

return { setup = setup }