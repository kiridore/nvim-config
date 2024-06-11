local dap, dapui = require("dap"), require("dapui")

dapui.setup()

local debug_begin = function ()
    _G.debugging = true
    dapui.open()
end

local debug_end = function ()
    if _G.debugging then
        _G.debugging = false
    end
    dapui.close()
end

dap.listeners.before.attach.dapui_config = debug_begin
dap.listeners.before.launch.dapui_config = debug_begin
dap.listeners.before.event_terminated.dapui_config = debug_end
dap.listeners.before.disconnect.dapui_config = debug_end
dap.listeners.before.event_exited.dapui_config = debug_end
