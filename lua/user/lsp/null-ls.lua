local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.completion.luasnip,

    formatting.prettier.with {
      extra_filetypes = { "toml", "svelte" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      timeout = 3000,
    },
    -- formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    -- formatting.google_java_format,
    -- diagnostics.flake8,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.formatting.eslint,
    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.completion.tags,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.diagnostics.xo.with{
      args = {"--stdin-filename", "$FILENAME"}
    },
    require("null-ls").builtins.diagnostics.tsc,
    require("null-ls").builtins.diagnostics.write_good,
    require("null-ls").builtins.completion.spell,
    require("null-ls").builtins.code_actions.gitsigns,
  },
}
