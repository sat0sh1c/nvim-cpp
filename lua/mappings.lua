require "nvchad.mappings"

local map = vim.keymap.set
local dap = require "dap"

map("n", "<F5>", function() dap.continue() end)
map("n", "<F10>", function() dap.step_over() end)
map("n", "<F11>", function() dap.step_into() end)
map("n", "<F12>", function() dap.step_out() end)
map("n", "<F4>", function() dap.toggle_breakpoint() end)
map("n", "<F6>", function () dap.terminate() require("dapui").close() end)
map("n", "<leader>bl", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
map("n", "<leader>dl", function() dap.run_last() end)
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
