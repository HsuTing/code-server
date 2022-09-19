syntax on
set encoding=utf-8
set nu
set ruler

" tab setting
set expandtab
set tabstop=2
set shiftwidth=2
retab

" set backspace
set backspace=indent,eol,start

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on
