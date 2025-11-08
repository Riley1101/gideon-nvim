vim.lsp.enable("pyright")
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tsserver")
vim.lsp.enable("biome")
vim.lsp.enable("svelte")
vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
	enable = true,
	settings = {
		["rust-analyzer"] = {
			linkedProjects = {
				"./src-tauri/Cargo.toml",
				"./Cargo.toml",
			},
			procMacro = {
				enable = false,
			},
		},
	},
})

vim.lsp.enable("golangci_lint_ls")
