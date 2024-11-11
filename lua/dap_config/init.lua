local config_path = vim.fn.stdpath("config")
package.path = package.path .. string.format(";%s", config_path .. "/lua/dap_config/?.lua")

require("dap_ui")

-- adapters
require("adapters.cpptools")
require("adapters.gdb")

--config
require("configs.cpp")
require("configs.rust")

