" Use UTF-8 encoding
set encoding=utf8

" Enable line numbers plus relative numbers
set number relativenumber

" Set tabs as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Show trailing tabs and spaces
set list listchars=tab:»·,trail:·
set list

" Highlight search results
:set hlsearch

" Finding files:
" Add all subdirectories to path, allowing for searching through them
set path+=**
" Display all matching files when we tab complete
set wildmenu

if !exists('g:vscode')
    " Enable spellcheck
    set spell
    " Enable syntax highlighting
    syntax on
endif
