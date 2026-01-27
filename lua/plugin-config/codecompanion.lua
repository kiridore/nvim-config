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
        log_level = "DEBUG",
    },
})
