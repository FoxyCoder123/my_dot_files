--General configs
local opts = { noremap=true, silent=true }
local nvim_lsp = require('lspconfig') 

--- Document highlights
local function document_highlight()
	vim.api.nvim_exec([[
		hi LspReferenceRead  guifg=#DCDCDC
		hi LspReferenceText  guifg=#DCDCDC
		hi LspReferenceWrite guifg=#DCDCDC
		augroup lsp_document_highlight
			autocmd!
			autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            autocmd CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
		augroup END
	]], false)
end

--highlight each keyword present in the file (add above if required)
--autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
--autocmd CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
 

--capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false, -- Enable underline, use default values
	virtual_text = true, -- Enable virtual text only on Warning or above, override spacing to 2
    signs = true,
    --show_diagnostic_autocmds = { 'InsertLeave', 'Textchanged' },
    --diagnostic_delay = 500
}   
)

--attach config
local on_attach = function(client, bufnr)
    --Enable completion triggered by C-x C-o
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    document_highlight()

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

--- Custom attach
local on_attach_vim = function()
	document_highlight()
	vim.keymap.set("n", "<leader>dc", ":Telescope diagnostics bufnr=0<cr>")
	vim.keymap.set('n', '<leader>gr', ":Telescope lsp_references<cr>", { buffer = 0 })
end


-------------------------------------------
--lsp setup for golang
-------------------------------------------

nvim_lsp.gopls.setup{
    cmd = {'gopls'},
    settings = {
        gopls = {
            analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            },
        experimentalPostfixCompletions = true,
        gofumpt = true,
        staticcheck = true,
        usePlaceholders = true,
        },
    },
    flags = {
      debounce_text_changes = 100, -- Wait 5 seconds before sending didChange
    },
	on_attach = on_attach,
    capabilities=capabilities
}

--goimports
function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
end

-------------------------------------------
--lsp setup for python
-------------------------------------------

nvim_lsp.pyright.setup{
    flags = {
      debounce_text_changes = 100, -- Wait 5 seconds before sending didChange
    },
	on_attach = on_attach,
    capabilities=capabilities
}



--Beautifying LSP status like E H W to cooler
--You must have nerd to enable this

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
