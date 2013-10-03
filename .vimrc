" ---------------------------
"  Shortcuts
" ---------------------------
command! W :w               " >_< Woah, at last I fixed this

" ---------------------------
"  Basic Settings
" ---------------------------
set nocompatible            " Don't be compatible with vi
syntax on                   " syntax highlighing
colorscheme solarized       " Set colorscheme to soloarized
filetype plugin on          " 
filetype plugin indent on   " 
set paste                   " do not indent pasted text
set ls=2                    " allways show status line
set scrolloff=3             " keep 3 lines when scrolling
set showcmd                 " display incomplete commands
set ruler                   " show the cursor position all the time
set nobackup                " do not keep a backup file
set number                  " show line numbers
set title                   " show title in console title bar
set ttyfast                 " smoother changes
set nostartofline           " don't jump to first character when paging
set noerrorbells            " don't bell
set vb t_vb=                " don't blink
set cursorline              " have a line indicate the cursor location
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex


" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
