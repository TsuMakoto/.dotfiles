if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  " Add or remove your plugins here:
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
 
  if !has('nvim')
    " for vim8
    set pyxversion=3
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " set toml-path
  let s:toml_dir = expand('~/.dotfiles/vim/rc/toml') 

  " load toml files
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
"   " lazy load toml files
  call dein#load_toml(s:toml_dir . '/dein_html.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/dein_py.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/dein_ruby.toml', {'lazy': 1})
	
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
