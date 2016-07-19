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

" syntastic
NeoBundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Let vundle manage some bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\   }
\ }

NeoBundle 'Align'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'shougo/vimshell.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'vim-scripts/cscope.vim'
NeoBundle 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" --------------------------------------------------------------------

NeoBundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

" --------------------------------------------------------------------

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
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-surround' 
NeoBundle 'davidhalter/jedi-vim'

" Taglist
NeoBundle 'taglist.vim'
nnoremap <silent><C-l> :Tlist<CR>
nnoremap <silent><C-u> :TlistUpdate<CR>

" CTags assist
NeoBundle 'szw/vim-tags'
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.svn/tags

" NeoBundle 'oranget/vim-csharp'

NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows': 'MSBuild.exe ~/.vim/omnisharp-server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac': 'xbuild ~/.vim/omnisharp-server/OmniSharp.sln',
\     'unix': 'xbuild ~/.vim/omnisharp-server/OmniSharp.sln',
\   }
\ }

NeoBundle 'valloric/youcompleteme'

" ------------------------------------------------------------------------
" Omnisharp settings
" ------------------------------------------------------------------------

augroup omnisharp_commands
	autocmd!

	"Set autocomplete function to OmniSharp (if not using YouCompleteMe
	"completion plugin)
	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	
	" Automatically add new cs files to the nearest project on
	" save
	autocmd BufWritePost *.cs call OmniSharp#AddToProject()

	"show type information automatically when the cursor stops moving
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	"The following commands are contextual, based on the current cursor
	"position.
	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap fi :OmniSharpFindImplementations<cr>
	autocmd FileType cs nnoremap ft :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap fs :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap fu :OmniSharpFindUsages<cr>
	autocmd FileType cs nnoremap fm :OmniSharpFindMembers<cr>
	autocmd FileType cs nnoremap <C-R> :OmniSharpRename<cr>
	"finds members in the current buffer

	" cursor can be anywhere on the line containing an issue 
	autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
	autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
	autocmd FileType cs nnoremap tt :OmniSharpTypeLookup<cr>
	autocmd FileType cs nnoremap dc :OmniSharpDocumentation<cr>
	autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
	autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field

	let g:OmniSharp_selector_ui = 'unite'

augroup END
" ------------------------------------------------------------------------

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" for macvim
NeoBundle 'koron/minimap-vim'

" for text aligning
NeoBundle 'godlygeek/tabular'

" Comment Toggle with press , twice
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

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

if bufwinnr(1)
	map - <C-W><UP>
	map + <C-W><DOWN>
endif

" visual tab makes shift the lines and shift to reverse
vmap <Tab> >gv
vmap <S-Tab> <gv

" history jump
nnoremap <C-H> :jumps<cr>

" ------------------------------------------------------------------------

set hlsearch
set nu
set autoindent
set cindent

syntax on
colorscheme monokai
