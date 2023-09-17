require('neodev').setup()

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>r', vim.lsp.buf.rename, 'rename')
	nmap('<leader>ca', vim.lsp.buf.code_action, 'code action')

	nmap('<leader>gd', vim.lsp.buf.definition, 'definition')
	nmap('<leader>gt', vim.lsp.buf.declaration, 'type definition')
	nmap('<leader>gr', require('telescope.builtin').lsp_references, 'references')
	nmap('<leader>gi', require('telescope.builtin').lsp_implementations, 'implementations')
	nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, 'go to document symbols')

	-- See `:help K` for why this keymap
	nmap('<leader>k', vim.lsp.buf.hover, 'hover documentation')
	nmap('<leader>K', vim.lsp.buf.signature_help, 'signature documentation')

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
