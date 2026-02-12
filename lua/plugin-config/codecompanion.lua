require("codecompanion").setup({
    interactions = {
        chat = {
            adapter = "ollama",
            model = "qwen2.5-code:14b"
        },
        inline = {
            adapter = "ollama",
            model = "qwen2.5-code:14b"
        },
    },
    opts = {
        language = "Chinese",
        log_level = "DEBUG",
    },
    -- prompt_library = {
    --     markdown = {
    --         dirs = {
    --             vim.fn.stdpath("config") .. "/prompts", -- Can be relative
    --         },
    --     },
    -- }
})
