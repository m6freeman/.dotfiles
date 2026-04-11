return {
    "huggingface/llm.nvim",
    enabled = false,
    opts = {
        lazy = true,
        lsp = {
            bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
        },
        backend = "ollama",
        model = "codellama:latest",
        url = "http://localhost:11434",
        request_body = {
            options = {
                temperature = 0.2,
                top_p = 0.95,
            },
        },
    },
}
