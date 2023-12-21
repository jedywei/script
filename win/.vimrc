"
" Install Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
"
" :so %   		    <-- reload .vimrc
" :set no<option>	<--- unset option
" :help <options>
" :set <option>?	<-- show the option value
" :map <F2>         <-- to get <F2> binding (or map)
"
" Features {{{ 1
"----------------------------------------------------------------------------
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as snely reset optiions when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filtype,
" and for plugins that are filetype specific.

" Enable syntax highlighting
syntax on
set background=dark
"colorscheme valloric
colorscheme elflord
" }}} End of Features

" Vundle plugin {{{ 1
"------------------------------------------------------------------------------------
" Brief help / :PluginList / :PluginInstall / :PluginSearch <foo>

filetype off    
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"-------------------------------------------------------------------
" Plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kshenoy/vim-signature'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'romainl/vim-qf'
Plugin 'chrisbra/Recover.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
"Plugin 'tommcdo/vim-lion'
"Plugin 'kana/vim-textobj-user'
"Plugin 'Julian/vim-textobj-variable-segment'
" restore_view.vim 
"   it will change my current directory to for example ../great/reef,  it's really annoying
"Plugin 'vim-scripts/restore_view.vim'
" vader.vim is alt-key mapping in terminal
"   it doesn't work for terminal with ssh remote target
"Plugin 'junegunn/vader.vim'

" vundle#end() can active all Plugin
call vundle#end()
filetype plugin indent on
" }}} End of Vundle plugin 

"let g:RecoverPlugin_Prompt_Verbose=1
let g:RecoverPlugin_Edit_Unmodified=1

" Plugin Settings {{{ 1
"-----------------------------------------------------------------------------------------
" vim-airline setting

set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
"let g:airline_theme='dark'
" enable tabline
let g:airline#extensions#tabline#enabled=1
" set left separator
let g:airline#extension#tabline#left_sep=' '
" set left separator which are not editting
let g:airline#extension#tabline#left_alt_sep ='|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
set encoding=utf-8
" timeoutlen is used for key stroke delay 
" ttimeoutlen is used for mapping delay 
set timeoutlen=2000
set ttimeoutlen=50
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

"----------------------------------------------------------------------------------------
" Tagbar    \L
" 
" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
" current file and get an overview of its structure. It does this by creating
" sidebar that displays the ctags-generated tags of the current file, orderd
" by there scope. 
nmap <leader>L :TagbarToggle<cr>
"cnoremap <silent>L<cr> :TagbarToggle<cr>
execute "set <A-l>=\el"
nmap <silent><A-l> :TagbarToggle<CR>
imap <silent><A-l> :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_width=30
let g:tagbar_ctags_bin = 'ctags'
" When vim tries to locate the 'tags' file, it first looks at the current
" directory, then the parent directory, and so on. 
set tags=tags;

"---------------------------------------------------------------------------------------
" CtrlP     ctrl-p  \F
" 
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" 
let g:ctrlp_map='<C-p>'
let g:cgrlp_cmd='CtrlP'
nnoremap <Leader>p :CtrlPMRU<CR>
nnoremap <A-p> :CtrlPMRU<CR>
inoremap <A-p> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore={
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tgz|tar.gz|pyc|mov|png|h265|h264|mp4|ts)$',
    \}
let g:ctrlp_root_markers=['.ctrlp']
let g:ctrlp_working_path_mode='rc'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_open_new_file='e'
let g:ctrlp_by_filename=1
let g:ctrlp_match_current_file=1
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)' :     ['<C-right>'], 
    \ 'ToggleType(-1)' :    ['<C-left>'],
    \ 'PrtExit()' :         ['<ESC>', '<C-c>', '<C-g>', '<A-q>'],
    \}
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'


if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for list files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching=0
endif

"---------------------------------------------------------------------------------------
" YouCompleteMe
"
"ucomment following command will disable YCM module
"let g:loaded_youcompleteme=1
" :h ins-completion-menu
" Use Ctrl-e to cancel auto completion menu
" Use Ctrl-j to expand snippet defination
" Use Enter to expand selected item
" 
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_sed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
"let g:ycm_enable_diagnostic_signs=0
"let g:ycm_enable_diagnostic_highlighting=0
"let g:ycm_key_list_previous_completion = ['<S-TAB>']
"let g:ycm_key_list_select_completion = ['<TAB>']
"remove <S-TAB> from list_stop_completion for delimitMate plugin
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_previous_completion=['<C-p>']
let g:ycm_key_list_select_completion=['<C-n>', '<TAB>']
"inoremap <expr><CR> pumvisible() ? "\<C-E>" : "\<CR>"
" Arrow Key mapping for insert mode
inoremap <expr><Up> pumvisible() ? "\<Up>" : "\<Esc>gk"
inoremap <expr><Down> pumvisible() ? "\<Down>" : "\<Esc>gj"
inoremap <expr><Left> pumvisible() ? "\<C-e>\<Esc>a" : "\<Esc>\<Left>"
inoremap <expr><Right> pumvisible() ? "\<C-y>" : "\<Esc>\<Right>"
set completeopt=longest,menu
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gi :YcmCompleter GoToInclude<CR>
nnoremap gb <C-O>
"nnoremap gc g;

let g:ycm_always_populate_location_list=1
highlight YcmWarningSection term=reverse ctermfg=black gui=undercurl guisp=#FFFFFF

"-----------------------------------------------------------------------------------------------
" ultisnips
" 
" Use ctrl-j to expand the snippet 
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" 
let g:UltiSnipsExpandTrigger='<C-j>'
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']


"------------------------------------------------------------------------------------------------
" vim-signature 
" 
" remove SignColumn highlight color  
" 
highlight SignColumn ctermbg=none
highlight SignatureMartText ctermbg=none

"------------------------------------------------------------------------------------------------
" Ack
" 
" using ag. install macOS 'brew install the_silver_searcher',  CentOS 'yum install the _silver_searcher'
" I don't want to jump to the first result automatically
" usage example
" :ack -i select    // ignore case
" :ack -w select    // match whole word
"
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
cnoreabbrev ack Ack!

"let g:ackpreview=1

" }}} End of Plugin Setting

"-------------------------------------------------------------
" My Own help and My own plugin 
" NOTE: helptags path/doc     doc is must
helpt ~/.vim/doc/
" altkeydef
"source ~/.vim/plugin/altkeydef.vim
" * starsearch
runtime! starsearch.vim
" mruModifiedBuffer
"runtime! mruModifiedBuffer.vim
" sidewindows
runtime! sidewindows.vim

" projectdir
"source ~/.vim/plugin/projectdir.vim
"let g:projectdir_rootmarkers = g:ctrlp_root_markers

"bind <C-f> to grep word under cursor
if exists('*projectdir#get')
    let g:hasget = 1
    function! AckSearchWithProjectdir(item)
        echom a:item " " projectdir#get()
        execute 'Ack! ' . a:item . ' ' . projectdir#get()
    endfunction
    nnoremap <silent><C-A-f> :call AckSearchWithProjectdir("<C-R><C-W>")<CR>
    nnoremap <silent><A-f> :Ack! "\b<C-R><C-W>\b" .. <CR>
    nnoremap <silent><C-f> :Ack! "\b<C-R><C-W>\b"<CR>
    command! -nargs=1 Agdir call AckSearchWithProjectdir(<f-args>)
    cnoreabbrev agdir Agdir
    cnoreabbrev ag Ack! 
else
    let g:hasget = 0
    nnoremap <silent><A-f> :Ack! "\b<C-R><C-W>\b"<CR>
    nnoremap <silent><C-f> :Ack! "\b<C-R><C-W>\b"<CR>
    cnoreabbrev ag Ack!
endif
" 
" Option Settings {{{ 1
"-----------------------------------------------------------------------------------
" Must have options 
"
" 'hidden' option, which allows you to re-use the same window and switch
" from an unsaved buffer without saving it first. 
set hidden
"set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-l> to temporarily turn off highlight
set hlsearch
" Modelines have historically been a source of security vunerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script
"
" set nomodeline

"-------------------------------------------------------------
" Usability options 
"
" Allow backspacing over autoindent, line breaks and start of insert action
"set ignorecase
"set smartcase
set backspace=indent,eol,start
set number
set numberwidth=4
set autoindent
set nostartofline
set ruler
"set laststatus=2
set confirm
set visualbell
" And reset the terminal code for the visual bell. If visuallbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
set mouse=
" set mouse=a
set pastetoggle=<F10>
set incsearch
set scrolloff=5

"----------------------------------------------------------------------
" Identation options 
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2

"----------------------------------------------------------------------
" jump to the last position when repoening a file

if has ("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"----------------------------------------------------------------------
" Folding options          
" zo zc za (toggle) zR/zM
set foldenable
set foldmethod=manual
augroup foldmarker_vim
    autocmd!
    autocmd FileType vim :setlocal foldmethod=marker
augroup END
set foldnestmax=6
set foldlevelstart=6
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
"nmap <Space> zA

syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
hi def link cCustomFunc Function

"----------------------------------------------------------------------
" Resotre-view option 

set viewoptions=cursor,folds,slash,unix
"let g:skipview_files=['\.vim']

"insert a new line on normal mode
"nmap <CR> o<Esc>

let $VIMPROMPT="(vi)"


"set visual mode highlight
highlight Visual term=reverse ctermbg=238 guibg=#403D3D 

"change cursor shape between InsertMode and NormalMode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=3\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
"    let &t_SI = "\<Esc>]50;CursorShape=3\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[1 q"
endif
" Set // as C, C++, CS and java comment string
augroup clike_commentstring
    autocmd!
    autocmd FileType c,cpp,cs,java     setlocal commentstring=//\ %s
augroup END

" Set auto switch linenumber
set number relativenumber
let g:always_setnorelativenumber=0
augroup numbertoggle
    function! s:SetLineNumber()
        if (g:always_setnorelativenumber)
            set norelativenumber
        else
            set relativenumber
        endif
    endfunction 
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * call <SID>SetLineNumber()
    autocmd BufLeave,FocusLost,InsertEnter * setlocal norelativenumber
    autocmd InsertEnter * setlocal cursorline
    autocmd InsertLeave * setlocal nocursorline
    nnoremap <silent><Leader>n :let g:always_setnorelativenumber=!g:always_setnorelativenumber<CR>:call <SID>SetLineNumber()<CR>
augroup END

" }}} End of Option Settings

" Key Mappings {{{ 1
"----------------------------------------------------------------------------------------
" Map <C-L> (redraw screen) to also turn off search highlighting utnil the
" next search
nnoremap <C-L> :nohl<CR><C-L>
nnoremap zH     zt
nnoremap zL     zb
nnoremap zM     z.


" Buffer <- ->
nnoremap <C-A-Right> :bnext<CR>
nnoremap <C-A-Left> :bprev<CR>
inoremap <C-A-Right> <ESC>:bnext<CR>
inoremap <C-A-Left> <Esc>:bprev<CR>


" Backspace and Del to enter insert mode
"nnoremap <silent><BS> i<BS>
nnoremap <silent><Del> i<Del>

" Cursor Movement
" insert mode arrow key has been defined above at YCM
"inoremap <Left> <Esc><Left>
"inoremap <Right> <Esc><Right>
"inoremap <Down> <Esc>gj
"inoremap <Up> <Esc>gk
inoremap <S-Left> <Left>
inoremap <S-Right> <Right>
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
noremap <S-Left> <Left>
noremap <S-Right> <Right>
noremap <S-Up> <Up>
noremap <S-Down> <Down>
nnoremap <Down> gj
nnoremap <Up> gk

" Word movement 
inoremap <A-Left> <Esc>B
inoremap <A-Right> <Esc>W
nnoremap <A-Left> B
nnoremap <A-Right> W

" move between last editor
inoremap <C-Up> <Esc>g;
inoremap <C-Down> <Esc>g,
nnoremap <C-Up> g;
nnoremap <C-Down> g,
" inoremap <C-Up> <PageUp>
" inoremap <C-Down> <PageDown>
" nnoremap <C-Up> <PageUp>
" nnoremap <C-Down> <PageDown>

" move to definition or declaration
"inoremap <silent><C-Right> <Esc>:YcmCompleter GoToDefinitionElseDeclaration<CR>
"inoremap <C-Left> <Esc><C-o>
"nnoremap <silent><C-Right> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <C-Left> <C-o>
nmap <silent><C-right> <Plug>mruModifiedBuffer_next
nmap <silent><C-left> <Plug>mruModifiedBuffer_previous
imap <silent><C-right> <ESC><Plug>mruModifiedBuffer_next
imap <silent><C-left> <ESC><Plug>mruModifiedBuffer_previous
nmap <silent><A-m> <Plug>mruModifiedBuffer_add
nmap <leader>m <Plug>mruModifiedBuffer_print
nmap <leader>r <Plug>mruModifiedBuffer_del


" function movement
inoremap <A-Up> <Esc>[[
inoremap <A-Down> <Esc>]]
nnoremap <A-Up> [[
nnoremap <A-Down> ]]

" {}() movement for c language
augroup BucketRedefine
    autocmd! 
    autocmd FileType c nnoremap <silent><buffer>}  :call search('}')<CR>:let @/='}'<CR>
    autocmd FileType c nnoremap <silent><buffer>{  :call search('{', 'b')<CR>:let @/='{'<CR>
    autocmd FileType c nnoremap <silent><buffer>)  :call search(')')<CR>:let @/=')'<CR>
    autocmd FileType c nnoremap <silent><buffer>(  :call search('(', 'b')<CR>:let @/='('<CR>
    autocmd FileType c nnoremap <silent><buffer>[<Space> {
    autocmd FileType c nnoremap <silent><buffer>]<Space> }
augroup END

"save
nnoremap <silent> s :w<CR>
noremap  <C-s> :wa<CR>
noremap! <C-s> <C-o>:wa<CR>
noremap <silent><C-a> :wa<CR>:make<CR>
inoremap <silent><C-a> <Esc>:wa<CR>:make<CR>
"cnoremap w!! w !sudo tee % >/dev/null
cnoreabbrev sudow w !sudo tee % > /dev/null

" quit
nnoremap <silent>zz :quit<CR>
nnoremap <silent>X :bd<CR>

" <C-V> to column mode selection
 
" paste
" inoremap <C-v> <ESC>"0gP
" nnoremap <C-v> "0gP
" vnoremap <C-v> <ESC>"0gP
" cnoremap <C-v> <C-r>"
" copy
nnoremap <leader>pp "0p
" nnoremap <leader>ss viw"0p
inoremap <C-c> <ESC>"0yiw
nnoremap <C-c>   "0yiw
vnoremap <C-c> ygv<ESC>
nnoremap Y y$
vnoremap gy :w! ~/.vimclipboard<CR>
nnoremap gy :.w! ~/.vimclipboard<CR>
nnoremap gp :set paste<CR>:r ~/.vimclipboard<CR>:set nopaste<CR>

" window toggle
nnoremap <A-w> <C-w>w
inoremap <A-w> <ESC><C-w>w
nnoremap <C-x> <C-w>w
augroup WindowToggle
    autocmd!
    autocmd CmdWinEnter * nnoremap <buffer><C-x> <C-c>
augroup End

"delete
"inoremap    <M-.>   <Del>
"nnoremap    <M-.>   <Del>

"nnoremap    <M-/>   dw
"inoremap    <M-/>   <Esc>dwi

"--------------------------------------------------------------------
" Mappings to access buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1, 2, 3, ... etc

nnoremap <silent><Leader>b  :bp<CR>
nnoremap <silent><Leader>f  :bn<CR>
nnoremap <silent><Leader>g  :e#<CR>
nnoremap <silent><Leader>1  :1b<CR>
nnoremap <silent><Leader>2  :2b<CR>
nnoremap <silent><Leader>3  :3b<CR>
nnoremap <silent><Leader>4  :4b<CR>
nnoremap <silent><Leader>5  :5b<CR>
nnoremap <silent><Leader>6  :6b<CR>
nnoremap <silent><Leader>7  :7b<CR>
nnoremap <silent><Leader>8  :8b<CR>
nnoremap <silent><Leader>9  :9b<CR>
nnoremap <silent><Leader>0  :10b<CR>

" q: used to be open command line history
" but it's annoyed, when I try to enter ':q' 
map q: <NOP>

" auto-pairs is good, but it's annoyed when I want to insert just single quote

let g:AutoParisFlyMode = 0


"----------------------------------------------------------------------
" map toggle line number
nmap <silent><C-n> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>


"----------------------------------------------------------------------
" map for programming development shortcut
nnoremap <silent>gh :A<CR>

nmap <silent><A-q>  <Plug>sidewindows#alt_q
imap <silent><A-q>  <Plug>sidewindows#alt_q

"----------------------------------------------------------------------
" 'Q' is used to enter EX mode, here disable it
map Q <Nop>
"----------------------------------------------------------------------
" q mapping for close quickfix, location and help window

augroup QuickFix_KeyMapping
    autocmd!
    autocmd FileType help nnoremap <buffer>q :q<CR>
    autocmd CmdWinEnter * nnoremap <buffer>q :q<CR>
    autocmd CmdWinEnter * nnoremap <buffer><ESC> :q<CR>
    autocmd FileType quickfix nnoremap <buffer>q :call QuickfixCommand('x', 1)<CR>
    autocmd FileType quickfix nnoremap <buffer><Up> :call QuickfixCommand('k', 1)<CR>
    autocmd FileType quickfix nnoremap <buffer><Down> :call QuickfixCommand('j', 1)<CR>
    autocmd FileType quickfix nnoremap <buffer><S-Up> k
    autocmd FileType quickfix nnoremap <buffer><S-Down> j
    autocmd FileType quickfix nnoremap <buffer><S-Left> h
    autocmd FileType quickfix nnoremap <buffer><S-Right> l
    autocmd FileType quickfix nnoremap <buffer><CR> <C-w>p
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    " Quickfix up / down 
    nnoremap <C-A-Down> :call QuickfixCommand('j', 0)<CR>
    nnoremap <C-A-Up> :call QuickfixCommand('k', 0)<CR>
    inoremap <C-A-Down> <Esc>:call QuickfixCommand('j', 0)<CR>
    inoremap <C-A-Up> <Esc>:call QuickfixCommand('k', 0)<CR>

    function! QuickfixCommand(key, switchwin)
        try 
            if !empty(getqflist())
                if a:key == 'x' 
                    execute 'cclose'
                elseif a:key == 'k'
                    execute 'cprev'
                    if a:switchwin | execute "normal! \<C-w>p" | endif
                elseif a:key == 'j'
                    execute 'cnext'
                    if a:switchwin | execute "normal! \<C-w>p" | endif
                else
                    execute "normal! a:key"
                endif
            elseif !empty(getloclist(winnr()))
                if a:key == 'x' 
                    execute 'lclose'
                elseif a:key == 'k' 
                    execute 'lprev'
                    if a:switchwin | execute "normal! \<C-w>p" | endif
                elseif a:key == 'j'
                    execute 'lnext'
                    if a:switchwin | execute "normal! \<C-w>p" | endif
                else
                    execute "normal! a:key"
                endif
            else
                echoerr "No items in location or quickfix list"
            endif
        catch /.*/
            echo v:exception
        endtry
    endfunction 
augroup End


" }}} End of Key Mappings

" last line ----------
