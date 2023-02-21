syntax on
set background=dark
filetype plugin indent on
set showmatch
set ignorecase
set smartcase
set incsearch
set tabstop=2
set magic


set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
