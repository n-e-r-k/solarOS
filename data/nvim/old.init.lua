 -- Launching plugins
--[[
vim.cmd([[
  call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()
]])
--]]

-- Options
vim.opt.number = true
