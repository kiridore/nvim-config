local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup_handlers({
    function(server_name) -- 默认处理
        lspconfig[server_name].setup({})
    end,
})
