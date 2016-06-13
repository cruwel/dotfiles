if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/ruel/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/ruel/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Let vundle manage some bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\   }
\ }

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'vim-scripts/cscope.vim'

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
       inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
       " <C-h>, <BS>: close popup and delete backword char.
       inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
       inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
       inoremap <expr><C-y>  neocomplete#close_popup()
       inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" NerdTree and shorcuts
NeoBundle 'scrooloose/nerdtree'
map  <C-t> :tabnew<CR>
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right>   :tabnext<CR>

NeoBundle 'tpope/vim-dispatch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'

" Taglist
NeoBundle 'taglist.vim'
nnoremap <silent><C-l> :Tlist<CR>
nnoremap <silent><C-u> :TlistUpdate<CR>

" CTags assist
NeoBundle 'szw/vim-tags'
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.svn/tags

NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows': 'MSBuild.exe ~/.vim/omnisharp-server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac': 'xbuild ~/.vim/omnisharp-server/OmniSharp.sln',
\     'unix': 'xbuild ~/.vim/omnisharp-server/OmniSharp.sln',
\   }
\ }

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'koron/minimap-vim'

NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" minimap
" NeoBundle 'severin-lemaignan/vim-minimap'
" nnoremap <silent><C-m> :Minimap<CR>
" let g:minimap_highlight='Visual'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ------------------------------------------------------------------------
"  Key maps for easy to use
" ------------------------------------------------------------------------

nnoremap <silent><C-(> :vertical resize -1<CR>
nnoremap <silent><C-)> :vertical resize +1<CR>

" ------------------------------------------------------------------------

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'severin-lemaignan/vim-minimap'
nnoremap <silent><C-m> :MinimapSync<CR>

call vundle#end()            " required
filetype plugin indent on    " required

set hlsearch
set nu
set autoindent
set cindent

syntax on
colorscheme monokai
