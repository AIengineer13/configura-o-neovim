-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]) 

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end  

return packer.startup(function(use)  

-- packer can manage itself
	use("wbthomason/packer.nvim") 
  

  use("nvim-lua/plenary.nvim") 

  -- lua functions that many plugins us

  -- file explorer
use("nvim-tree/nvim-tree.lua")


use("bluz71/vim-nightfly-guicolors") 
-- preferred colorscheme
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
 

	use("szw/vim-maximizer") -- maximizes and restores current window
   
  use("kyazdani42/nvim-web-devicons")  

  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion) 

-- commenting with gc
	use("numToStr/Comment.nvim")

	use("nvim-lualine/lualine.nvim")
 -- telescope  -- telescope  -- telescope  -- telescope  -- telescope  -- telescope  -- telescope  -- telescope  -- telescope 
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder


--cmp plugins 

use("hrsh7th/nvim-cmp") -- completion plugin
use("hrsh7th/cmp-buffer") -- source for text in buffer
use("hrsh7th/cmp-path") -- source for file syste  


-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig


 -- servidores  LSP 
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use ({ 
    "jayp0521/mason-null-ls.nvim",
    "jayp0521/mason-nvim-dap.nvim",})
  

    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters   
  use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("mfussenegger/nvim-jdtls")
use("mfussenegger/nvim-dap-python") 

-- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
 
  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags


use('https://github.com/rktjmp/lush.nvim')
use('https://github.com/nocksock/bloop.nvim')
use("https://github.com/rktjmp/lush.nvim")

-- Lua

use { 
  'olivercederborg/poimandres.nvim',
  config = function()
    require('poimandres').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    }
  end
}


use ("rebelot/kanagawa.nvim")



  if packer_bootstrap then
		require("packer").sync()
	end
end)
