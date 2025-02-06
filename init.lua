vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
require "plugins.debugger"

local dap = require "dap"
local dapui = require "dapui"
dapui.setup()

dap.adapters.codelldb = {
   type = "server",
   port = "${port}",
   executable = {
      command = "codelldb",
      args = { "--port", "${port}" },
   },
}

dap.configurations.cpp = {
   {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      args = {},
      stopOnEntry = false,
   },
}


vim.schedule(function()
  require "mappings"
end)
