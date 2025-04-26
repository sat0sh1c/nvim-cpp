local home = os.getenv "HOME"
local options = {
   formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      cpp = { "clang_format" },
   },
   formatters = {
      clang_format = {
         prepend_args = { "--style=file:" .. home .. "/.config/nvim/lua/configs/.clang_format" },
      },
   },

   format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
   },
}

return options
