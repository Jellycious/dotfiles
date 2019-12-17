" My Configuration: python friendly, ranger, vundle
" These are the vim settings I use 
" Author: Jelle Meijer
"
" Aesthetic settings
" Requires the gruvbox.vim colorscheme!
set encoding=utf-8
set termguicolors
set title
set bg=dark
" Indentation and Numbering
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Backup files
" requires ~/.vimtmp folder exists
" and also .backup, .swp and .undo folder
set backupdir=~/.vimtmp/.backup//
set directory=~/.vimtmp/.swp//
set undodir=~/.vimtmp/.undo//

"Code Folding"
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Arbitrary settings
set ignorecase
set nohlsearch
"VUNDLE"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"put plugins below this line"
"Python indentation"
Plugin 'vim-scripts/indentpython.vim'
"Auto completion"
Plugin 'Valloric/YouCompleteMe'
"Code Folding"
Plugin 'tmhedberg/SimpylFold'
"File explorer"
Plugin 'scrooloose/nerdtree'
"Syntax Highlighting"
Plugin 'vim-syntastic/syntastic'
"Search from inside vim"
Plugin 'kien/ctrlp.vim'
"Git integration"
Plugin 'tpope/vim-fugitive'
" Smooth scroll
Plugin 'terryma/vim-smooth-scroll'
"color schemes"
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
"Set colorscheme"
colorscheme gruvbox
"Make sure YouCompleteMe does it thing correctly
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"Map smooh scroll to buttons
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR> 
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR> 
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 2)<CR> 
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 2)<CR> 
"Proper python indentation"
au BufNewFile,BufRead *.py
            \ set tabstop=4     |
            \ set softtabstop=4 |
            \ set shiftwidth=4  |
            \ set expandtab     |
            \ set autoindent    |
            \ set fileformat=unix

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"map NerdTree"
map <C-n> :NERDTreeToggle<CR>
"make code pretty"
let python_highlight_all=1
syntax on

" RANGERCHOOSER "
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

" DEFAULTS: 
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


