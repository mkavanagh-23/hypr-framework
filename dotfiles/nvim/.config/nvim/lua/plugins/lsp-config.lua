return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Apply nvim-cmp capabilities to every server, including system-installed ones.
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- qmlls ships with Qt and must be available on PATH.
      vim.lsp.enable("qmlls")

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP keybindings",
        callback = function(args)
          local bufnr = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>fmt", function()
            vim.lsp.buf.format({ async = true })
          end, "Format document")
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gr", function()
            require("telescope.builtin").lsp_references()
          end, "References")
          map("n", "K", vim.lsp.buf.hover, "Hover details")
          map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostics")
          map("n", "gK", function()
            vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
          end, "Toggle diagnostic virtual lines")
        end,
      })

      -- Mason installs these servers and enables them when available.
      -- Its PowerShell Editor Services config supplies the startup command.
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "bashls", "clangd", "cssls", "html",
          "sqls", "pylsp", "gopls", "powershell_es",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
}
