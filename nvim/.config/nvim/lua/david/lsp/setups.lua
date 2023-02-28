local lsp_attach = require("david.lsp.attach")

local lsp_flags = {
	debounce_text_changes = 150,
}

return setmetatable({
	rust_analyzer = function()
		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
			settings = {
				["rust-analyzer"] = {},
			},
		}
	end,
	
	emmet_ls = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "blade", "vue" },
		}
	end,

    sumneko_lua = function()
		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,

pyright = function()
    return {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
  	python = {
    	analysis = {
      		autoSearchPaths = true,
      		diagnosticMode = "workspace",
      		useLibraryCodeForTypes = true
    	},
   	},
    },
    }
    end,
    tsserver = function()
        return {
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" }
        }
    end,
}, {
	__index = function()
		return function ()
			return {
				on_attach = lsp_attach,
				flags = lsp_flags,
			}
		end
	end,
})