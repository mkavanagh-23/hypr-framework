local parsers = {
  "regex",
  "lua",
  "python",
  "javascript",
  "c",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "cpp",
  "bash",
  "css",
  "html",
  "cmake",
  "hyprlang",
  "json",
  "latex",
  "make",
  "dockerfile",
  "typescript",
  "xml",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()

    -- Install missing parsers
    treesitter.install(parsers)

    -- Enable Treesitter highlighting and indentation
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
