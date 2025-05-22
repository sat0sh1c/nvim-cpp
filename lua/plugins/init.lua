return {
   {
      "stevearc/conform.nvim",
      event = "BufWritePre", -- uncomment for format on save
      opts = require "configs.conform",
   },

   -- These are some examples, uncomment them if you want to see them work!
   {
      "neovim/nvim-lspconfig",
      config = function()
         require "configs.lspconfig"
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

         function Is_process_running(name)
            local handle = io.popen("pgrep -f " .. name)
            local pid = tonumber(handle:read "*a")
            if pid == nil then
               handle:close()
               return false
            end
            handle:close()
            return true
         end
         dap.configurations.cpp = {
            {
               name = "Launch file",
               type = "codelldb",
               request = "launch",
               program = function()
                  os.execute "kitty --detach ~/./build.sh"
                  while true do
                     local is_running = Is_process_running "build.sh"
                     if is_running == false then
                        break
                     end
                     os.execute "sleep 1s"
                  end
                  return vim.fn.getcwd() .. "/build/" .. os.getenv "CURRENT_PROJECT"
               end,
               cwd = "${workspaceFolder}",
               args = {},
               stopOnEntry = false,
            },
         }
      end,
      ensure_installed = {
         "Decodetalkers/neocmakelsp",
         "clangd/clangd",
         "hrsh7th/nvim-cmp",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
      },
   },

   {
      "nvim-treesitter/nvim-treesitter",
      opts = {
         ensure_installed = {
            "vim",
            "lua",
            "vimdoc",
            "html",
            "css",
            "cmake",
            "cpp",
         },
      },
   },
}
