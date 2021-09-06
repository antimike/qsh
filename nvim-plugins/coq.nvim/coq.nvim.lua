-- Changes to support LSP snippets:
-- url: https://github.com/ms-jpq/coq_nvim
local lsp = require "lspconfig"
local coq = require "coq" -- add this

-- lsp.<server>.setup(<stuff...>)                              -- before
-- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>)) -- after
