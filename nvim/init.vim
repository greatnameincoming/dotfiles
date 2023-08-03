lua require('plugins')

set mouse = 

set number
set nowrap
set relativenumber

set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
 
let mapleader = " "

" Telescope bindings
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>ff :Telescope find_files<CR>

" Nerdtree bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" NerdTree Git icons
let NERDTreeGitStatusUseNerdFonts = 1

" Vim Markdown
let g:markdown_folding = 2

" Vim Pencil
autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})

" VimWiki
let g:wiki_root = '~/SyncedFolder/VimWiki/'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'

" MarkDownPreview
let g:mkdp_filetypes = ['markdown']
