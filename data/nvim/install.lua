vim.cmd([[
  call plug#begin()
  PlugInstall 'tpope/vim-sensible'
  PlugInstall 'scrooloose/nerdtree'
  PlugInstall 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()
]])