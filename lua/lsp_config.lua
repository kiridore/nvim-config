local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup_handlers({
    function(server_name) -- 默认处理
        if server_name == "clangd" then
            lspconfig[server_name].setup({
                cmd = {
                    "clangd",
                    "--query-driver=C:/msys64/mingw64/bin/*"
                }
            })
        else
            lspconfig[server_name].setup({})
        end
    end,
})
