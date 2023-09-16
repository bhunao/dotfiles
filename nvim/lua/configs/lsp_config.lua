require('neodev').setup()

local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>r', vim.lsp.buf.rename, 'rename')
	nmap('<leader>ca', vim.lsp.buf.code_action, 'code action')

	nmap('<leader>gd', vim.lsp.buf.definition, 'definition')
	nmap('<leader>gD', vim.lsp.buf.declaration, 'type definition')
	nmap('<leader>gr', require('telescope.builtin').lsp_references, 'references')
	nmap('<leader>gi', require('telescope.builtin').lsp_implementations, 'implementations')
	nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, 'go to document symbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')

	-- See `:help K` for why this keymap
	nmap('<leader>d', vim.lsp.buf.hover, 'hover documentation')
	nmap('<leader>d', vim.lsp.buf.signature_help, 'signature documentation')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
	nimls = {},
	pyright = {},
	rust_analyzer = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end
}
