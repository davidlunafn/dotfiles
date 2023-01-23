-- LSP configuration

-- install servers and tools
require('david.lsp.mason')
local setups = require("david.lsp.setups")

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
	function (server_name)
		lspconfig[server_name].setup(setups[server_name]())
	end
})

