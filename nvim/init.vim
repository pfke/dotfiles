" TODO
"  -buffer schliessen mit :q (wenn letzter buffer, vim zu)
"  -easymotion <Leader>hjkl umlegen auf was anderes, die Bewegungen sind zu praktisch
"  -S-j join lines ist jetzt mit line move belastet
"  -nach einem Enter im insert-mode wird irgendwas eingefügt
"  -'-' geht nicht mehr
"  -gutter mit jump marks
"  -kein search-around: am Ende der Datei stehen bleiben
"  -Maus-Klick setzt nicht den Fenster-Fokus (Klick in anderen Tab aktiviert
"  ihn nicht)
"  -sprung zur letzten Position
"  -tabularize
"  -irgendein tag system
"  -visible marks


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" : plugin
"
    " bootstrap
    let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
    if !filereadable(autoload_plug_path)
      silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
          \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    unlet autoload_plug_path

    " Specify a dir for plugins
    call plug#begin('~/.local/share/nvim/plugged')

    " easy motion w/ visual assistents
    Plug 'easymotion/vim-easymotion'

    " search plugin for better search
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    " improved * motions
    Plug 'haya14busa/vim-asterisk'
    " see search status in e.g cmdline (workds w/ incsearch)
    Plug 'osyo-manga/vim-anzu'

    " colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'connorholyday/vim-snazzy'
    " A collection of language packs for Vim. (syntax highlighting, ...)
    Plug 'sheerun/vim-polyglot'

    " show indent guide bars to visualize indent levels
    " https://github.com/Yggdroot/indentLine
    Plug 'nathanaelkane/vim-indent-guides'

    " better status line
    " https://github.com/itchyny/lightline.vim
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'

    " THE git plugin
    " https://github.com/tpope/vim-fugitive
    Plug 'tpope/vim-fugitive'

    " surround everything w/ braces, brackets, ...
    Plug 'tpope/vim-surround'

    " open files at last edit pos
    Plug 'farmergreg/vim-lastplace'

    " split window by visual selection
    Plug 'wellle/visual-split.vim'
    " provide more text objects to operate on
    Plug 'wellle/targets.vim'

    " hightlight yank ops
    Plug 'machakann/vim-highlightedyank'

    " yank stack
    Plug 'svermeulen/vim-yoink'

    " THE git plugin
    Plug 'luochen1990/rainbow'

    " vcs marker
    " https://github.com/mhinz/vim-signify
    Plug 'mhinz/vim-signify'

    " navigating files
    " https://github.com/scrooloose/nerdtree
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " nerdcommenter
    Plug 'scrooloose/nerdcommenter'

    " file finder
    " https://github.com/junegunn/fzf
    Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " distraction free writing
    " https://github.com/junegunn/goyo.vim
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " undotree
    " https://github.com/mbbill/undotree
    Plug 'mbbill/undotree'

    " show filetype icons
    " e.g. in nerdtree, bufferline, ...
    " need a nerd font compatible font installed
    " load after various plugins
    Plug 'ryanoasis/vim-devicons'

    " expand selection
    Plug 'terryma/vim-expand-region'

    " auto pairs: brace management
    Plug 'jiangmiao/auto-pairs'

    " makefile nutzer
    Plug 'neomake/neomake'

    """"""""""""""""""""""""""""""""""
    " completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " scala support
    Plug 'derekwyatt/vim-scala'

    " Track the engine.
    "Plug 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    " multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    " multiple cursors
    Plug 'embear/vim-localvimrc'

    " Initialize plugin system
    call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" : general
"
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: tabbing
        set expandtab " insert spaces whenever the tab key is pressed
        set tabstop=4
        set shiftwidth=4 " numbers of spaces inserted for indentation
        set list " show all white spaces as char
        " change all tabs in the current line to match tab settings
        map <Leader><A-Space> :.retab<CR>
        " change all tabs match the tab settings
        map <Leader><Leader><A-Space> :retab<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: undo
        if has('persistent_undo')
            set undolevels=1000
            set undodir=$HOME/.local/nvim/undodir
            set undofile
        endif

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: other
        set showmatch " show matching bracets when text indicator is over them

        set history=1000 " keep 1000 lines fo command line history

        " sounds
        set noerrorbells
        set novisualbell

        set nostartofline " keep the same col when jumping around w/ G gg ...

        " auto trim tailing whitespaces on save
        "augroup onExit
        "    autocmd!
        "    autocmd FileType vim,c,cpp,java,php,pl,sh autocmd BufWritePre <buffer> %s/\s\+$//e
        "augroup END

        " autoreload vimrc changes and reload
        if has ('autocmd') " Remain compatible with earlier versions
         augroup vimrc     " Source vim configuration upon save
            autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
            autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
          augroup END
        endif " has autocmd

        set nocompatible
        set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" : code completion
"
    " Configuration for coc.nvim
    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes
    " Some server have issues with backup files, see #649
    set nobackup
    set nowritebackup
    " Better display for messages
    set cmdheight=2
    " Use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Remap for do codeAction of current line
    nmap <leader>ac <Plug>(coc-codeaction)
    " Remap for do action format
    nnoremap <silent> F :call CocAction('format')<CR>
    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if &filetype == 'vim'
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    
    " Notify coc.nvim that <enter> has been pressed.
    " Currently used for the formatOnType feature.
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'
    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    " Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

    " Configuration for vim-scala
    au BufRead,BufNewFile *.sbt set filetype=scala 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" : key mappings
"
    let mapleader = ","

    " yank to the line end (behave like other capital commands)
    nnoremap Y y$
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q

    " create newlines w/o entering insert mode
    nnoremap go o<Esc>k
    nnoremap gO O<Esc>j

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: editing
        """""
        " :: auto pairs
            let g:AutoPairsShortcutToggle = '<M-p>'
            let g:AutoPairsShortcutJump = ''
            let g:AutoPairsShortcutFastWrap = '<M-e>'
            let g:AutoPairsShortcutBackInsert = ''

        " :: surround.vim

        """""
        " :: vim-multiple-cursor
            " ### normal mode / visual mode
            "   * start:                `<C-n>` start multicursor and add a _virtual cursor + selection_ on the match
            "     * next:               `<C-n>` add a new _virtual cursor + selection_ on the next match
            "     * skip:               `<C-x>` skip the next match
            "     * prev:               `<C-p>` remove current _virtual cursor + selection_ and go back on previous match
            "   * select all:           `<A-n>` start multicursor and directly select all matches
            "   * start w/o boundaries  `g<C-n>` to match without boundaries (behaves like `g*` instead of `*`)
            " The command `MultipleCursorsFind` accepts a range and a pattern (regexp), it creates a _visual cursor_ at the end of each match.
            let g:multi_cursor_use_default_mapping=0

            " Default mapping
            let g:multi_cursor_start_word_key      = '<C-n>'
            let g:multi_cursor_select_all_word_key = '<A-n>'
            let g:multi_cursor_start_key           = 'g<C-n>'
            let g:multi_cursor_select_all_key      = 'g<A-n>'
            let g:multi_cursor_next_key            = '<C-n>'
            let g:multi_cursor_prev_key            = '<C-p>'
            let g:multi_cursor_skip_key            = '<C-x>'
            let g:multi_cursor_quit_key            = '<Esc>'
            " Default highlighting (see help :highlight and help :highlight-link)
            "highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
            "highlight link multiple_cursors_visual Visual

        " :: hightlight yank ops
            " Plug 'machakann/vim-highlightedyank'
            " This option changes the highlighting duration.
            " Assign a number of time in milli seconds.
            let g:highlightedyank_highlight_duration = 500
            " If a negative number is assigned, the highlight gets persistent.
            " When another text is yanked or when the user starts editing, the old
            " highlighting will be deleted.


    """"""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: motion
        " movement by screen line instead of file line (for text wrap)
        nnoremap <silent> j gj
        nnoremap <silent> <down> gj
        nnoremap <silent> <C-j> 20gjzz
        nnoremap <silent> <C-down> 20gjzz
        nnoremap <silent> k gk
        nnoremap <silent> <up> gk
        nnoremap <silent> <C-k> 20gkzz
        nnoremap <silent> <C-up> 20gkzz
        nnoremap <silent> 0 g0
        nnoremap <silent> $ g$

        " move to next empty line
        nnoremap <C-l> }
        " move to prev empty line
        nnoremap <C-h> {

        " navigate split screens easily
        nmap <silent> <A-h> :wincmd h<CR>
        nmap <silent> <A-j> :wincmd j<CR>
        nmap <silent> <A-k> :wincmd k<CR>
        nmap <silent> <A-l> :wincmd l<CR>

        " If your '{' or '}' are not in the first column, and you would like to use "[["
        " and "]]" anyway, try these mappings: >
        nmap [[ ?{<CR>
        nmap [] ?}<CR>
        nmap ]] /{<CR>
        nmap ][ /}<CR>

        """""
        " :: visual split
            xmap <C-W>gr  <Plug>(Visual-Split-VSResize)
            xmap <C-W>gss <Plug>(Visual-Split-VSSplit)
            xmap <C-W>gsa <Plug>(Visual-Split-VSSplitAbove)
            xmap <C-W>gsb <Plug>(Visual-Split-VSSplitBelow)

            nmap <C-W>gr  <Plug>(Visual-Split-Resize)
            nmap <C-W>gss <Plug>(Visual-Split-Split)
            nmap <C-W>gsa <Plug>(Visual-Split-SplitAbove)
            nmap <C-W>gsb <Plug>(Visual-Split-SplitBelow)

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: searching
    "
        " C-r: Easier search and replace
        xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
        " Returns visually selected text
        function! s:get_selection(cmdtype) "{{{
            let temp = @s
            normal! gv"sy
            let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
            let @s = temp
        endfunction "}}}

        """""
        " :: incsearch:
        "       -incsearch: highlights all pattern matched (unlike default incsearch)
        "       -fuzzy: sucht fehlerhaft
        "       -easymotion: jump to result w/ easymotion
        "
            " If you set this option to 1, error and warning messages with search
            " command don't save into message-history. message-history doesn't
            " be messed up with some unneeded error and warning messages like E486,
            " search hit BOTTOM, continuing at TOP warning, and so on. Welcome clean
            " message-history!
            let g:incsearch#do_not_save_error_message_history = 1

            " Highlight matched pattern separately with forward matches and
            " backward matches.
            let g:incsearch#separate_highlight = 1
            let g:incsearch#highlight = {
                \   'match' : {
                \     'group' : 'IncSearchUnderline',
                \     'priority' : '10'
                \   },
                \   'on_cursor' : {
                \     'priority' : '100'
                \   },
                \   'cursor' : {
                \     'group' : 'ErrorMsg',
                \     'priority' : '1000'
                \   }
                \ }

            nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

            map /  <Plug>(incsearch-forward)
            map ?  <Plug>(incsearch-backward)
            map g/ <Plug>(incsearch-stay)

            " :: anzu
              map n  <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
              map N  <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)

            " :: asterisk
            map *   <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
            map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
            map g*  <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
            map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)

            map <S-z>/ <Plug>(incsearch-fuzzyspell-/)
            map <S-z>? <Plug>(incsearch-fuzzyspell-?)
            map <S-z>g/ <Plug>(incsearch-fuzzyspell-stay)

            map z/ <Plug>(incsearch-easymotion-/)
            map z? <Plug>(incsearch-easymotion-?)
            map zg/ <Plug>(incsearch-easymotion-stay)


    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: nerdcommenter
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


    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: signify
        nmap <Leader>n <Plug>(signify-next-hunk)
        nmap <Leader><S-n> <Plug>(signify-prev-hunk)

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: fzf
        " This is the default extra key bindings
        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }

        " Default fzf layout
        " - down / up / left / right
        let g:fzf_layout = { 'down': '~40%' }

        " In Neovim, you can set up fzf window using a Vim command
        let g:fzf_layout = { 'window': 'enew' }
        let g:fzf_layout = { 'window': '-tabnew' }
        let g:fzf_layout = { 'window': '10new' }

        " Customize fzf colors to match your color scheme
        let g:fzf_colors = {
            \   'fg':      ['fg', 'Normal'],
            \   'bg':      ['bg', 'Normal'],
            \   'hl':      ['fg', 'Comment'],
            \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \   'hl+':     ['fg', 'Statement'],
            \   'info':    ['fg', 'PreProc'],
            \   'border':  ['fg', 'Ignore'],
            \   'prompt':  ['fg', 'Conditional'],
            \   'pointer': ['fg', 'Exception'],
            \   'marker':  ['fg', 'Keyword'],
            \   'spinner': ['fg', 'Label'],
            \   'header':  ['fg', 'Comment']
            \ }

        " Enable per-command history.
        " CTRL-N and CTRL-P will be automatically bound to next-history and
        " previous-history instead of down and up. If you don't like the change,
        " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
        let g:fzf_history_dir = '~/.local/share/fzf-history'

        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1

        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'

        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'

        nmap <Leader>fm <Plug>(fzf-maps-n)
        xmap <Leader>fm <Plug>(fzf-maps-x)
        omap <Leader>fm <Plug>(fzf-maps-o)

        nmap <Leader>fa :Ag<CR>
        nmap <Leader>fb :Buffers<CR>
        nmap <Leader>fc :History:<CR>
        nmap <Leader>ff :Files<CR>
        nmap <Leader>fl :Lines<CR>
        nmap <Leader>fm :Maps<CR>
        nmap <Leader>fo :History<CR>
        nmap <Leader>fr :Marks<CR>
        nmap <Leader>fs :Snippets<CR>
        nmap <Leader>f/ :History/<CR>

        nmap <Leader>fü :Colors<CR>

        nmap <Leader>fgb :Gblame<CR>
        nmap <Leader>fgc :Commits<CR>
        nmap <Leader>fgd :Gvdiffsplit<CR>
        nmap <Leader>fgf :GFiles<CR>
        nmap <Leader>fgs :Gstatus<CR>
        nmap <Leader>fgl :Glog<CR>

        " Insert mode completion
        imap <c-x><c-k> <Plug>(fzf-complete-word)
        imap <Leader>p <Plug>(fzf-complete-path)
        imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <Plug>(fzf-complete-line)

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: goyo
        let g:goyo_width = 120
        nnoremap <Leader><Space> :Goyo<CR>
        function! s:goyo_enter()
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
          endif
          set noshowmode
          set noshowcmd
          set scrolloff=999
          Limelight
          " ...
        endfunction

        function! s:goyo_leave()
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
          endif
          set showmode
          set showcmd
          set scrolloff=5
          Limelight!
          " ...
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: neomake
        " When writing a buffer (no delay).
        "call neomake#configure#automake('w')
        " When writing a buffer (no delay), and on normal mode changes (after 750ms).
        call neomake#configure#automake('nw', 750)
        " When reading a buffer (after 1s), and when writing (no delay).
        "call neomake#configure#automake('rw', 1000)
        " Full config: when writing or reading a buffer, and on changes in insert and
        " normal mode (after 1s; no delay when writing).
        "call neomake#configure#automake('nrwi', 500)

        let g:neomake_open_list = 2

        " debugging
        "let g:neomake_verbose = 3
        "let g:neomake_logfile = '/tmp/neomake_error.log'

        nnoremap <silent> <F3> :lprev<CR>
        nnoremap <silent> <F4> :lnext<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: undotree
        nnoremap <Leader>u :UndotreeToggle<CR>
        let g:undotree_WindowLayout = 4

        " Avoid installing twice.
        if exists('g:loaded_undotree')
            finish
        endif
        let g:loaded_undotree = 0
        let g:undotree_SetFocusWhenToggle = 1
        let g:undotree_HighlightChangedText = 1
        " Highlight linked syntax type.
        " You may chose your favorite through ":hi" command
        if !exists('g:undotree_HighlightSyntaxAdd')
            let g:undotree_HighlightSyntaxAdd = "DiffAdd"
        endif
        if !exists('g:undotree_HighlightSyntaxChange')
            let g:undotree_HighlightSyntaxChange = "DiffChange"
        endif
        if !exists('g:undotree_HighlightSyntaxDel')
            let g:undotree_HighlightSyntaxDel = "DiffDelete"
        endif


    """"""""""""""""""""""""""""""""""""""""""""""""""""
    " :: other
        " toggle background color mode
        map <Leader>bg :let &background=( &background == "dark" ? "light" : "dark" )<CR><CR>

        set wrap
        nnoremap <silent> <Leader>w :set wrap!<CR>

        " underline current line with '-'
        nnoremap <Leader>ul :t.\|s/./-/g\|:nohls<CR>
        " underline current line with '='
        nnoremap <leader>uul :t.\|s/./=/g\|:nohls<CR>

        " duplicate lines - similar to intellij
        function! <SID>duplicateLine_moveLineAndKeepCursorCol()
            let l = line(".")
            let c = col(".")

            normal! Yp

            call cursor(l, c)

            normal! j
        endfun
        nnoremap <C-d> :call <SID>duplicateLine_moveLineAndKeepCursorCol()<CR>

        " Fast saving
        nnoremap <silent><Leader>w :write<CR>
        vnoremap <silent><Leader>w <Esc>:write<CR>
        nnoremap <silent><C-s> :<C-u>write<CR>
        vnoremap <silent><C-s> :<C-u>write<CR>
        cnoremap <silent><C-s> <C-u>write<CR>

        " Save a file with sudo
        " http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
        cmap W!! w !sudo tee % >/dev/null

        " Drag current line/s vertically and auto-indent
        vnoremap <S-k> :m-2<CR>gv=gv
        vnoremap <S-up> :m-2<CR>gv=gv
        vnoremap <S-j> :m'>+<CR>gv=gv
        vnoremap <S-down> :m'>+<CR>gv=gv
        noremap  <S-k> :m-2<CR>
        noremap  <S-up> :m-2<CR>
        noremap  <S-j> :m+<CR>
        noremap  <S-down> :m+<CR>


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" : ui zeuch
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: general
        " enable 256 color term
        set t_Co=256
        " enable true color
        if has('termguicolors')
            set termguicolors
        endif

        " oder terminal weit setzen
        set guifont=DroidSansMono\ Nerd\ Font\ 11

        filetype plugin indent on
        syntax on

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: colorscheme-rotz (settings for 'morhetz/gruvbox' scheme)
        set background=dark " start w/ this mode
        "set background=light
        let g:gruvbox_contrast_dark='hard'  " set contrast for dark mode 'hard | medium | soft'
        let g:gruvbox_contrast_light='soft' " set contrast for light mode 'hard | medium | soft
        let g:gruvbox_italic='1'
        colorscheme gruvbox

        "colorscheme snazzy


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: better rainbow parenthesis
        let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
        let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'guis': [''],
            \   'cterms': [''],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'markdown': {
            \           'parentheses_options': 'containedin=markdownCode contained',
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'haskell': {
            \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
            \       },
            \       'vim': {
            \           'parentheses_options': 'containedin=vimFuncBody',
            \       },
            \       'perl': {
            \           'syn_name_prefix': 'perlBlockFoldRainbow',
            \       },
            \       'stylus': {
            \           'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
            \       },
            \       'css': 0,
            \   }
        \ }

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " :: other
        " both absolute and relative line numbers are enabled by default, which produces “hybrid” line numbers.
        " When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on.
        " This also happens when the buffer loses focus, so you can glance back at it to see which absolute line
        " you were working on if you need to.
        set number relativenumber " show relative line numbers
        augroup numbertoggle
            autocmd!
            autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
            autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
        augroup END

        " Plug: indentLines
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_guide_size = 1

        " resizing
        nmap <C-PageUp> <C-w>+
        nmap <C-PageDown> <C-w>-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :: easymotion: fast motion by typing the activation letter: s
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    nmap ss <Plug>(easymotion-s2)
    nmap sd <Plug>(easymotion-s)
    nmap sf <Plug>(easymotion-overwin-f)
    map  sh <Plug>(easymotion-linebackward)
    map  sl <Plug>(easymotion-lineforward)
    map  sj <Plug>(easymotion-j)
    map  sk <Plug>(easymotion-k)
    map  s/ <Plug>(easymotion-sn)
    omap s/ <Plug>(easymotion-tn)
    map  sn <Plug>(easymotion-next)

    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion   map  sp <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :: expand region
    map <C-+> <Plug>(expand_region_expand)
    map <C--> <Plug>(expand_region_shrink)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :: lightline+bufferline
    set laststatus=2
    let g:lightline = {
        \       'enable': { "statusline": 1, "tabline": 1 },
        \       'colorscheme': 'snazzy',
        \       'mode_map': { 'n': 'N', 'v': 'V', 'i': 'I', 'c': 'C', 'r': 'R', 's': 'S', 't': 'T' },
        \       'active': {
        \           'left': [  [ 'mode', 'paste' ],
        \                      [ 'bufnum', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \           'right': [ [ 'lineinfo' ],
        \                      [ 'percent' ],
        \                      [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
        \       },
        \       'component': {
        \           'charvaluehex': '0x%02B'
        \       },
        \       'component_function': {
        \           'gitbranch': 'fugitive#head'
        \       },
        \   }
    let g:lightline.tabline          = { 'left': [[ 'buffers' ]], 'right': [['close']] }
    let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
    let g:lightline.component_type   = { 'buffers': 'tabsel' }

    set showtabline=2
    if has('gui_running')
        set guioptions-=e
    endif

    let g:lightline#bufferline#show_number = 2
    let g:lightline#bufferline#number_separator = ' '
    let g:lightline#bufferline#filename_modifier = ':.'
    "let g:lightline#bufferline#number_map = {
    "        \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
    "        \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'
    "    }
    "

    nmap <Leader>1 <Plug>lightline#bufferline#go(1)
    nmap <Leader>2 <Plug>lightline#bufferline#go(2)
    nmap <Leader>3 <Plug>lightline#bufferline#go(3)
    nmap <Leader>4 <Plug>lightline#bufferline#go(4)
    nmap <Leader>5 <Plug>lightline#bufferline#go(5)
    nmap <Leader>6 <Plug>lightline#bufferline#go(6)
    nmap <Leader>7 <Plug>lightline#bufferline#go(7)
    nmap <Leader>8 <Plug>lightline#bufferline#go(8)
    nmap <Leader>9 <Plug>lightline#bufferline#go(9)
    nmap <Leader>0 <Plug>lightline#bufferline#go(10)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :: nerdtree
    " auto open nerdtree, when vim is started w/o a file specified
    map <Leader><S-Tab> :NERDTreeFind<CR>
    map <Leader><Tab>   :NERDTreeToggle<CR>
    au StdinReadPre * let s: std_in=1
    au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " automatically close NerdTree when you open a file
    let NERDTreeQuitOnOpen = 1
    " automatically dekete the buffer of the file you just deleted w/ NerdTree
    let NERDTreeAutoDeleteBuffer = 1
    " make NerdTree prettier
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let NERDTreeMapCustomOpen = "<Right>"

    " automatically close a tab if the only remaining window is nerdtree
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :: yoink
    nmap <c-n> <plug>(YoinkPostPasteSwapBack)
    nmap <c-p> <plug>(YoinkPostPasteSwapForward)

    nmap p <plug>(YoinkPaste_p)
    nmap P <plug>(YoinkPaste_P)

