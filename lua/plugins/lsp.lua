-- plugins/lsp.lua
-- lsp starts here
return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            -- Configure pylsp for Python
            lspconfig.pylsp.setup({
                cmd = { vim.fn.stdpath("data") .. "/mason/bin/pylsp" }, -- Ensure correct path
                settings = {
                    pylsp = {
                        configurationSources = {}, -- Prevent using sources like "pycodestyle" or "pylint" by default
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                                ignore = { "E262", "W391", "E501" },
                                maxLineLength = 120
                            },
                            pylint = { enabled = true },
                            -- mypy = { enabled = false },
                            -- pyflakes = { enabled = false },
                            -- mccabe = { enabled = false },
                            jedi_completion = { enabled = true },
                            jedi_hover = { enabled = true },
                            jedi_references = { enabled = true },
                            jedi_signature_help = { enabled = true },
                            jedi_symbols = { enabled = true, all_scopes = true },
                            jedi = {
                                environment = nil, -- Default to no environment; will be updated dynamically
                            },
                        },
                    },
                },
                on_attach = function(client, bufnr)
                    -- Dynamically set the Python environment for Jedi
                    local venv_path = os.getenv("VIRTUAL_ENV")
                    if venv_path then
                        -- Notify LSP server to update its configuration
                        client.config.settings.pylsp.plugins.pylint.args = { "--rcfile", venv_path .. "/pyproject.toml" }
                        client.notify("workspace/didChangeConfiguration", {
                            settings = {
                                pylsp = {
                                    plugins = {
                                        jedi = {
                                            environment = venv_path, -- Dynamically set the virtual environment
                                        },
                                    },
                                },
                            },
                        })
                        print("Using Python environment: " .. venv_path)
                    else
                        print("No virtual environment detected.")
                    end
                end,
            })

            -- Configure phpactor for PHP
            lspconfig.phpactor.setup({
                cmd = { "phpactor", "language-server" },
                filetypes = { "php" },
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            -- Configure clangd for C/C++
            lspconfig.clangd.setup({
                cmd = { "clangd", "--background-index" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern(".clangd", "compile_commands.json", ".git"),
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                init_options = {
                    fallbackFlags = {
                        "-I./include", -- Include your project-specific include directory
                        "-I../include",
                        "-I../../inclde",
                        "-Iinclude",
                        "-I/usr/include", -- Ensure system includes are accessible
                        "-I/usr/local/include", -- Optional for local includes
                    },
                },
            })

            -- Configure tsserver for JavaScript and TypeScript
            lspconfig.ts_ls.setup({
                cmd = { "typescript-language-server", "--stdio" },
                filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
                root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                on_attach = function(client, bufnr)
                    -- Example keymap
                    local opts = { noremap = true, silent = true }
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                end,
            })

            --Config for Graphql
            lspconfig.graphql.setup({
                cmd = { "graphql-lsp", "server", "-m", "stream" }, -- Default command for graphql-language-service
                filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
                root_dir = lspconfig.util.root_pattern(".graphqlconfig", "graphql.config.*", ".git"),
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                on_attach = function(client, bufnr)
                    -- No keymaps added here, just attach the client if necessary
                end,
            })

            --Config for vue
            lspconfig.volar.setup({
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
                init_options = {
                    typescript = {
                        tsdk = "/home/han/.nvm/versions/node/v20.18.1/lib/node_modules/typescript/lib",
                    }
                },
            })

            --Config for html
            lspconfig.html.setup({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                filetypes = { "html", "htmldjango" }, -- Add other filetypes if needed
                init_options = {
                    provideFormatter = true,
                },
            })
            -- Configure gopls for Go
            lspconfig.gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        hints = {
                            assignVariableTypes = true, -- Show variable type for assignments
                            compositeLiteralFields = true, -- Show struct field names
                            compositeLiteralTypes = true, -- Show type for composite literals
                            constantValues = true, -- Show values of constants
                            functionTypeParameters = true, -- Show function type parameters
                            parameterNames = true, -- Show parameter names
                            rangeVariableTypes = true, -- Show range variable types
                        },
                    },
                },
            })

        end,
    },
}
