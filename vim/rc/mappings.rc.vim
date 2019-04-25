" Release keymappings for plug-in.
nnoremap m <Nop>
xnoremap m <Nop>
nnoremap , <Nop>
xnoremap , <Nop>
nnoremap q <Nop>
nnoremap j gj
nnoremap k gk
" inoremap <C-l> <C-c>dli
" inoremap <C-b> <C-f>
" inoremap <C-f> <C-b>

" Edit init.vim
nnoremap <Space>ev :tabnew ~/.dotfiles/vim/init.vim<CR>
" Reload init.vim
nnoremap <Space>rv :source ~/.dotfiles/vim/init.vim<CR>
" Open vim config-dir
nnoremap <Space>rd :NERDTreeToggle ~/.dotfiles/vim<CR>

" new tab
nnoremap <Space>tn :tabnew<CR>

" switch tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
for i in range(1, 9)
  execute 'nnoremap ' . i . '<Tab> ' . i . 'gt'
endfor

" switch window
" nnoremap wh <C-w>h
" nnoremap wj <C-w>j
" nnoremap wk <C-w>k
" nnoremap wl <C-w>l
" nnoremap wH <C-w>H
" nnoremap wJ <C-w>J
" nnoremap wK <C-w>K
" nnoremap wL <C-w>L

" resize tab
nnoremap <C-a> <C-w><
nnoremap <C-s> <C-w>>
nnoremap <C-p> <C-w>+
nnoremap <C-m> <C-w>-

" Skip move     
nnoremap H ^
noremap L $
