set number
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
colorscheme jellybeans
set clipboard+=unnamed

" キーマッピング
" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" htmlタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:config_dir = '~/.dotfiles/vim'
let $CONDA_ROOT = $HOME . '/.pyenv/versions/anaconda3-5.3.1/envs'

let g:python_host_prog = $CONDA_ROOT . '/nvim2/bin/python'
let g:python3_host_prog = $CONDA_ROOT . '/nvim3/bin/python'


" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
 
  if !has('nvim')
    " for vim8
    set pyxversion=3
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " set toml-path
  let s:toml_dir = expand(s:config_dir . '/toml') 

  " load toml files
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " lazy load toml files
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/dein_py.toml', {'lazy': 1})
	
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
