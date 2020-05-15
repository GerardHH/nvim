call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-surround'

if exists('g:vscode')
else
    Plug 'justinmk/vim-sneak'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
