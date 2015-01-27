let mapleader=","
let g:mapleader=","

"VUNDLE-HEADER{{
set nocompatible
filetype off                  " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

""let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
"}}

"customize-plugin(s) {
	"PlugPack nerdtree {
	Plugin 'scrooloose/nerdtree'
	nmap wm :NERDTreeToggle<cr>
	"}
	"PlugPack tagbar {
	Plugin 'majutsushi/tagbar'
	let g:tagbar_ctags_bin="/usr/bin/ctags"
	let g:tagbar_width=30
	nmap tag :TagbarToggle<cr>
	autocmd FileType h,hpp,c,cc,cxx,cpp,lua,py,java TagbarOpen
	set tags=tags
	"}
	Plugin 'vim-scripts/a.vim'
	"PlugPack airline {
	Plugin 'bling/vim-airline'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#show_buffers = 1
	let g:airline#extensions#tabline#show_tab_type = 1
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	nmap tN :tabnew<cr>
	nmap tC :tabclose<cr>
	nmap tp :tabp<cr>
	nmap tn :tabn<cr>
	nmap <Leader>bn :bn<cr>
	nmap <Leader>bp :bp<cr>
	"}
	"PlugPack easymotion "{
	Plugin 'Lokaltog/vim-easymotion'
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
	"}
	"PlugPack ctrlp {
	Plugin 'kien/ctrlp.vim' 
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	set wildignore+=*.so,*.swp,*.zip,*.o,*.bin
	nmap mix :CtrlPMixed<cr>
	"}
	"PlugPack snpimate {
	Plugin 'garbas/vim-snipmate' 
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	""""Plugin 'honza/vim-snippets'
	"}
	"PlugPack markdown {
	Plugin 'godlygeek/tabular'
	Plugin 'plasticboy/vim-markdown'
	let g:vim_markdown_initial_foldlevel=2
	"}
	Plugin 'mhinz/vim-signify' "version-control
	"TODO need to install auto-complete-plug {
	""Plugin 'Shougo/neocomplcache.vim'
	""------YouCompleteMe
	""Plugin 'Valloric/YouCompleteMe'
	"}
"}

"VUNDLE-FOOTER{{

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on                    " required on vim7.3??

"}}

"common-setting{{
set fileencoding=utf-8
"" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4


"" folding config
set foldenable
set foldcolumn=2
set foldmethod=syntax
set foldlevel=10
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
autocmd BufNewFile,BufRead *.vimrc set foldmarker={,} foldmethod=marker foldlevel=1

set ruler
set nu
set laststatus=2
au InsertEnter * hi StatusLine  ctermbg=201
au InsertLeave * hi StatusLine ctermbg=4
set statusline=%f%([%{Tlist_Get_Tag_Prototype_By_Line()}]%)[Line:%l/%L,Column:%c][%p%%]
set statusline=%f[Line:%l/%L,Column:%c][%p%%]

set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI
set viminfo+=!

"add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

"}}

"Feature 'cs' Review-And-Replace while searching (or use vim7.4:cgn ){{
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
"}}

"color-schemes{
"""---selected colorschemes---"""
	""-- blacklight busierbee 
	""-- holokai hornet iceberg jellybeans
	""-- molokai monokain Monokai
	""-- lucius Tomorrow up zenburn herokudoc 
	""-- C64 greenvision
	set t_Co=256
	color molokai "jellybeans
	"autocmd FileType md,mkd color lucius
"}

