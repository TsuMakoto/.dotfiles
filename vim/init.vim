set number
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
colorscheme jellybeans
set clipboard+=unnamed

" htmlタグ補完
" augroup MyXML
"   autocmd!
"   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
" augroup END

let g:config_dir = '~/.dotfiles/vim'
let g:rc_dir = g:config_dir . '/rc'
" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
  let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
    execute 'source' rc_file
  endif
endfunction

" dein用キャッシュディレクトリ作成
let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
 call mkdir(expand($CACHE), 'p')
endif

let $CONDA_ROOT = $HOME . '/.pyenv/versions/anaconda3-5.3.1/envs'
let g:python_host_prog = $CONDA_ROOT . '/nvim2/bin/python'
let g:python3_host_prog = $CONDA_ROOT . '/nvim3/bin/python'

" load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$CACHE/dein')
        \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
              \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

call s:source_rc('dein.rc.vim')
call s:source_rc('mappings.rc.vim')
call s:source_rc('surround.vim')
