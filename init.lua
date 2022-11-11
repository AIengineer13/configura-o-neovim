
require("bruno.plugins-setup")
require("bruno.core.options")
require("bruno.core.keymaps")
require("bruno.core.colorscheme")
require("bruno.plugins.comment")
require("bruno.plugins.nvim-tree")
require("bruno.plugins.lualine")
require("bruno.plugins.telescope")
require("bruno.plugins.nvim-cmp")
require("bruno.plugins.lsp.mason")
require("bruno.plugins.lsp.lspsaga")
require("bruno.plugins.lsp.handlers").setup()
require("bruno.plugins.lsp.null-ls") 
require("bruno.plugins.autopairs") 
require("bruno.plugins.treesitter")
require'lspconfig'.hls.setup{}

 


