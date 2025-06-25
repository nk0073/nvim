vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            print("Loaded rustaceanvim override")
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy", -- optional: use "check" if you want faster feedback
                },
                diagnostics = {
                    enable = true,
                    enableExperimental = true,
                },
            }
        },
    }
}

