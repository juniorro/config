" Settings
syntax on
set nocompatible
" set spell
" set spelllang=en_us
set redrawtime=10000
set hlsearch
set incsearch
set splitright
set scrolloff=3
set browsedir=buffer
set background=dark
set laststatus=2
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set nobackup
set noundofile
set incsearch
set completeopt-=preview
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set laststatus=2
set digraph
" set textwidth=5000

" Plugins
call plug#begin()
Plug 'dracula/dracula-theme'
Plug 'preservim/nerdtree'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Mappings
let mapleader = " "
imap jj <Esc>
nmap <silent><F3> :set rnu! <CR>
imap <silent><F3> <ESC> :set rnu! <CR>i
map bf :buffers<CR>
map bf :buffers<CR>
map <silent><leader><leader>u :%s/\s\+$//e <CR>
nmap <silent><leader>hk :vsplit ~/.vim/hotkeys<CR>
nmap <silent><leader>vs :vnew<CR>
nmap <silent><leader>q :q <CR>
nmap <silent><leader><leader>= :vertical resize +2 <CR>
nmap <silent><leader><leader>- :vertical resize -2 <CR>
nmap <silent><leader><leader><leader>= :resize +2 <CR>
nmap <silent><leader><leader><leader>- :resize -2 <CR>
map <C-L> 5zl
map <C-H> 2zh
nmap <silent><leader>w :w <CR>
nmap <silent><leader>r :wq <CR>
map <silent><leader><leader>m :call RenameFile()<CR>
map <silent><leader><leader>v :call VsplitWithFile()<CR>
map <silent><leader>b :call TabNewWithFile()<CR>
map <silent><leader><leader>bd :bd<CR>
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent><leader>t :NERDTreeToggle<CR>
nmap <silent><leader><leader>p :Prettier<CR>
nmap <silent><leader><leader>g :GoFmt<CR>
nmap <silent><leader><leader>f :Files<CR>
nnoremap <leader><leader>e <C-w>o<CR>
nnoremap <silent> <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
noremap <silent> <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
nnoremap <silent><leader><Tab> :bnext<CR>
nnoremap <silent><leader><Tab><Tab> :bprevious<CR>
nnoremap <silent><leader><Tab><Tab><Tab> :bd<CR>
nnoremap <leader><leader>a <C-w>h
nnoremap <leader><leader>s <C-w>l
nnoremap <leader><leader>w <C-w>k
nnoremap <leader><leader>z <C-w>j
nnoremap <leader><leader>x <C-w><C-w>
nnoremap <leader>o o<ESC>
nnoremap <leader><leader>o O<ESC>
nnoremap <silent><leader><leader>t :vertical terminal<CR>
nnoremap <silent><leader><leader>bs :sh<CR>
map <silent><leader><leader>r <C-End>
nmap <leader><leader>b :vertical ba<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Other Configs
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --ignore-vcs -g "!.git/"'
let g:NERDTreeWinSize=20
let NERDTreeMinimalUI=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#enabled = 1

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"packadd! dracula
filetype plugin on
colorscheme abstract

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" NerdCommenter Configs
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" Functions
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <CR> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! VsplitWithFile()
    let filename = input('File name: ', expand('%'), 'file')
    if filename != ''
        exec ':vsplit ' filename
        redraw!
    endif
endfunction

function! TabNewWithFile()
    let filename = input('File name: ', expand('%'), 'file')
    if filename != ''
        exec ':tabedit ' filename
        redraw!
    endif
endfunction
