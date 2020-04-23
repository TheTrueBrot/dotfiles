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
Plugin 'JuliaEditorSupport/julia-vim'

call vundle#end()            " required
filetype plugin indent on 

set number
syntax on

map <C-n> :NERDTreeToggle<CR>

" size of a hard tabstop
set tabstop=4

" always uses spaces instead of tab characters
set expandtab

"""""
"Nim Plugin

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

"""""
"Templates

if has("autocmd")
	augroup templates
		autocmd BufNewFile *socket.py 0r ~/.vim/templates/socket_python.py
  		autocmd BufNewFile *.c++ 0r ~/.vim/templates/skeleton.c++
		autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.c++
  		
	augroup END
endif
