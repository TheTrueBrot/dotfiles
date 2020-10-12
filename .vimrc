""""
"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zah/nim.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'dracula/vim'
call vundle#end()            " required
filetype plugin indent on 

set number
syntax on
colorscheme dracula
""""
"Mapping

"General Maps

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

map <C-n> :NERDTreeToggle<CR>
map <C-q> :UltiSnipsEdit<CR>

"Run files
autocmd FileType python map <F5> <ESC>:w<CR>:! clear; python %
autocmd FileType tex map <F5> <ESC>:VimtexCompile<CR>

"Remaps For Swiss Layout
map ö {
map ä }
map ü [

"""""
"Tabs
" size of a hard tabstop
set tabstop=4
" always uses spaces instead of tab characters
set shiftwidth=4
set expandtab

"""""
"LaTeX
let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:tex_flavor='latex'
let g:vimtex_indent_enabled = 0

"""""
"Snippet

let g:UltiSnipsExpandTrigger="§"
let g:UltiSnipsJumpForwardTrigger="§w"
let g:UltiSnipsJumpBackwardTrigger="§s"
let g:UltiSnipsEditSplit="vertical"

"""""
"YouCompleteMe Settings

"LaTeX

if !exists('g:ycm_semantic_triggers')         
    let g:ycm_semantic_triggers = {}            
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"""""
"Templates

if has("autocmd")
    augroup templates
        autocmd BufNewFile *socket.py 0r ~/.vim/templates/socket_python.py
        autocmd BufNewFile *.c++ 0r ~/.vim/templates/skeleton.c++
        autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.c++        
        autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex     
        
    augroup END
endif
