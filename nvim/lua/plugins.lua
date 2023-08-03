return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- so packer can update itself
  use { -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
  use 'neovim/nvim-lspconfig' -- native LSP support
  use 'hrsh7th/nvim-cmp' -- autocompletion framework
  use 'hrsh7th/cmp-nvim-lsp' -- LSP autocompletion provider
  use 'hrsh7th/cmp-path' -- autocompletion for path
  use 'hrsh7th/cmp-buffer' -- autocompletion for buffer
  use 'folke/tokyonight.nvim' -- Theme
  use 'nvim-lualine/lualine.nvim' -- Visual bar on the bottom

  use 'preservim/nerdtree' -- Visual file browser
  use 'Xuyuanp/nerdtree-git-plugin' -- Git status in nerd tree
  use 'ryanoasis/vim-devicons' -- Icons for file types

  use 'preservim/vim-markdown'

  use 'preservim/vim-pencil' -- Writing plugin

  use 'lervag/wiki.vim'
  use 'dhruvasagar/vim-table-mode'

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  require("tokyonight").setup({
    style = "night",
    transparent = true
  })

  vim.cmd [[colorscheme tokyonight-night]]
 
  local lualine_auto_theme = require('lualine.themes.auto')
  lualine_auto_theme.normal.c.bg = 'none'
  require('lualine').setup{options = {theme = lualine_auto_theme}};
  require('telescope').setup();

  -- autocomplete config
  local cmp = require('cmp')
  cmp.setup {
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
    }
  }

end)
