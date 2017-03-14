"==========================================
"加载插件
"==========================================

"修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on

" 设置tpl文件的语法高亮为vue
au BufRead,BufNewFile *.tpl setfiletype html

"
"==========================================
" General 基础设置
"==========================================

" history存储长度。
set history=2000


filetype on                 "检测文件类型
filetype indent on          "针对不同的文件类型采用不同的缩进格式
filetype plugin on          "允许插件
filetype plugin indent on   "启动自动补全


"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread                " 文件修改之后自动载入。
set shortmess=atI           " 启动的时候不显示那个援助索马里儿童的提示

" Create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=/tmp/vimundo
endif

set cursorcolumn            " 突出显示当前行等 不喜欢这种定位可注解
set cursorline              " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
"
set t_ti= t_te=

"- 则点击光标不会换,用于复制
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500


"==========================================
" Show 展示/排版等界面格式设置
"==========================================

set ruler               "显示当前的行号列号：

" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set showcmd
set showmode            "Show current mode

"在上下移动光标时，光标上方或下方至少会保留显示的行数
set scrolloff=7

"读取分支信息
" function! GitBranch()
"   let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
"   if branch != ''
"     return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
"   en  
"   return ''
" endfunction
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2 " 总是显示状态栏
" 
"
set number                    "显示行号：
set nowrap                    " 取消换行。

"设置文内智能搜索提示
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=syntax
set foldlevel=99
"za，打开或关闭当前折叠
"zM，关闭所有折叠
"zR，打开所有折叠

" 启动 vim 时关闭折叠代码
set nofoldenable

"缩进配置
set smartindent
set autoindent    "打开自动缩进

" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

"==========================================
" file encode, 文件编码,格式
"==========================================
set encoding=utf-8            " 设置新文件的编码为 UTF-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn               "language message zh_CN.UTF-8

set ffs=unix,dos,mac          " Use Unix as the standard file type

"如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
"合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost ~/.vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" JavaScript 文件, 4个空格缩进
autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType coffee set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType json set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType html set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType jinja set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType css set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType yaml,jade set tabstop=4 shiftwidth=4 expandtab ai

" Makefile 不使用空格替换tab
autocmd FileType make set noexpandtab ai


" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

"==========================================
"HotKey  自定义快捷键
"==========================================
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
"nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
"nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
"nmap <Leader>Q :qa!<CR>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L $


noremap <F1> <Esc>"
nnoremap <F2> :set number! number?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F6>      "    when in insert mode, press <F5> to go to
                          "    paste mode, where you can paste mass data
                          "    that won't be autoindented

"use sane regexes"
" nnoremap / /\v
" vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" --------tab/buffer相关

"Use arrow key to change buffer"
" TODO: 如何跳转到确定的buffer?
" :b1 :b2   :bf :bl
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" tab 操作
" TODO: ctrl + n 变成切换tab的方法
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" TODO: 配置成功这里, 切换更方便, 两个键
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


" ------- 选中及操作改键

"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"
" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=source\ sans\ pro,Monaco:h15   "Mac OS X
    if has("gui_gtk2")       "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

syntax enable
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif



set t_Co=256

" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" colorscheme tomorrow
" colorscheme tomorrow-night
" colorscheme tomorrow-night-eighties
" colorscheme tomorrow-night-bright

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" 自动语法高亮
syntax enable 


if has('gui_running')
    set guifont=source\ sans\ pro,Menlo\ for\ Powerline
endif

"like to have a different background in GUI and terminal modes, so I can use the following if-then. However, I find vim's background autodetection to be pretty good and, at least with MacVim, I can leave this background value assignment out entirely and get the same results'

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

" 用浅色高亮当前行"
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul


" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 让filetype-plugin根据文件类型自动缩进（这个必须要，它会根据文件类型自动配置缩进，插件在安装vim的时候已经装好了）
"filetype plugin indent on

"代码补全
" 关掉智能补全时的预览窗口
"set completeopt=longest,menu
" vim7.3中已经集成了omnicppcomplete了
set omnifunc=omni
" omnicppcomplete配置 关闭兼容模式
set nocp
" 打开文件类型检测,加了这句才可以用智能补全
"filetype plugin on
"set ofu=syntaxcomplete#Complete

"共享剪贴板
set clipboard+=unnamed

" 实现 (、[、{、"、'  输入后自动补全右边部分，光标也会位于中间位置
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1


"保存.vimrc文件后会自动调用新的.vimrc
"autocmd! bufwritepost _vimrc source $VIM/_vimrc

" 行号和标尺
"set rulerformat=%15(%c%V\ %p%%%)


" 设置less文件的高亮
"au BufNewFile,BufRead *.less set filetype=less


" 始终显示状态行
"set ls=2 
"命令行补全以增强模式运行
"set wildmenu 

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 精确替换
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 参考自 https://github.com/yangyangwithgnu/use_vim_as_ide#精确替换 
" vim 有强大的内容替换命令：
" 
" :[range]s/{pattern}/{string}/[flags]
" 在进行内容替换操作时，我关注几个因素：如何指定替换文件范围、是否整词匹配、是否逐一确认后再替换。
" 
" 如何指定替换文件范围？
" 
" 如果在当前文件内替换，[range] 不用指定，默认就在当前文件内；
" 如果在当前选中区域，[range] 也不用指定，在你键入替换命令时，vim 自动将生成如下命令：
" :'<,'>s/{pattern}/{string}/[flags]
" 你也可以指定行范围，如，第三行到第五行：
" :3,5s/{pattern}/{string}/[flags]
" 如果对打开文件进行替换，你需要先通过 :bufdo 命令显式告知 vim 范围，再执行替换；
" 如果对工程内所有文件进行替换，先 :args **/.cpp */*.h 告知 vim 范围，再执行替换；
" 是否整词匹配？{pattern} 用于指定匹配模式。如果需要整词匹配，则该字段应由 < 和 > 修饰待替换字符串（如，<iFoo>）；无须整词匹配则不用修饰，直接给定该字符串即可；
" 
" 是否逐一确认后再替换？[flags] 可用于指定是否需要确认。若无须确认，该字段设定为 ge 即可；有时不见得所有匹配的字符串都需替换，若在每次替换前进行确认，该字段设定为 gec 即可。
" 
" 是否整词匹配和是否确认两个条件叠加就有 4 种组合：非整词且不确认、非整词且确认、整词且不确认、整词且确认，每次手工输入这些命令真是麻烦；我把这些组合封装到一个函数中


" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should installplugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" GitHub上面的
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'groenewege/vim-less' " 用于less文件的语法高亮
" Plugin 'nono/jquery.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'mattn/emmet-vim' " 用于快速编写HTML代码的emmet
Plugin 'tmhedberg/matchit' " 匹配的扩展，能匹配HTMLtag 等等
Plugin 'posva/vim-vue' " vue.js的 .vue文件的语法高亮
Plugin 'haya14busa/incsearch.vim' " 用来强化vim的内置搜索功能
Plugin 'haya14busa/incsearch-fuzzy.vim' " 用来实现incsearch的模糊搜索功能
Plugin 'haya14busa/incsearch-easymotion.vim' " 是EasyMotion和incsearch直接配合的桥梁
Plugin 'tpope/vim-fugitive' " 基于vim的一系列git命令，方便在不切换到命令行的情况下进行git的相关命令操作
Plugin 'scrooloose/syntastic' " 语法检测和高亮工具
" Plugin 'leafgarland/typescript-vim' " tpescript的语法高亮
" Plugin 'Shougo/vimproc.vim'  " vimproc is a great asynchronous execution library for Vim
Plugin 'Quramy/tsuquyomi' " Make your Vim a TypeScript IDE.
Plugin 'SirVer/ultisnips' " vim 代码块引擎
Plugin 'honza/vim-snippets' " vim 代码块集合
Plugin 'Lokaltog/vim-powerline' " Powerline is a utility plugin which allows you to create better-looking, more functional vim statuslines.
Plugin 'nathanaelkane/vim-indent-guides' " Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'kshenoy/vim-signature' " 可视化vim书签
Plugin 'grassdog/tagman.vim' " 一个更现代化的为项目自动生成ctag文件的插件 https://dance.computer.dance/posts/2015/04/using-ctags-on-modern-javascript.html
Plugin 'majutsushi/tagbar' " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. 
Plugin 'mileszs/ack.vim' " The plugin allows you to run ack from Vim, and shows the results in a split window.
Plugin 'dyng/ctrlsf.vim' " An ack/ag/pt/rg powered code search and view tool, like ack.vim or :vimgrep but together with more context, and let you edit in-place with powerful edit mode.
Plugin 'terryma/vim-multiple-cursors' " 多光标编辑功能
Plugin 'wakatime/vim-wakatime' " 记录工作时间等相关信息
Plugin 'Valloric/YouCompleteMe' " 代码提示
Plugin 'heavenshell/vim-jsdoc' " JSDoc生成器
Plugin 'rizzatti/dash.vim' " 在vim内部用dash搜索相关接口



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line)





""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
 
"
" #### old config
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap ss <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap ss <Plug>(easymotion-s2)

" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" #### new config
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" Press <F5> to purge the cache for the current directory to get new files,
" remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a
" new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"
"
"
" 使用Ctrl+d 来切换路径优先还是文件名优先
" 查找范围以当前操作的文件进行
" 可以录入新文件名（新文件可以在新的路径里） 然后用Ctrl+Y来编辑，保存改文件之后就自动生成了
" Ctrl + f 来切换 file/buffers(缓冲区)/mru files(最近打开的文件)
" Ctrl + j/k 来在列表里面上下移动，也可以使用上下方向键
" Ctrl + z 来标记文件为选中的 选择完成之后，按Ctrl + O来打开所有选中的文件
" 在输入的文件路径最后加上冒号和数字(:3) 就会在打开之后，跳转到指定行;
" 加上斜杠和单词，就会在打开之后，搜索该单词，并把光标跳转到第一个搜索到的。（其实就是vim的原生命令模式语法）

" 设定打开多个文件的时候，以竖向分屏的模式
let g:ctrlp_open_multiple_files = 'v'

" 设定，当安装了ag (silver searcher) 的时候，修改ctrlp默认使用的搜索方法
if executable("ag")
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

     " Use ag in CtrlP for listing files. Lightning fast and respects  .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" 设定ctrlp全局要忽略的文件类型
set wildignore+=*.so,*.swp,*.zip,*.swf
" let g:ctrl_custom_ignore = {
"  \ 'dir':  '\v[\/]\.?(DS_Store|git|hg|svn|node_modules)$',
"  \ 'file': '\v\.(log|jpg|png|jpeg|DS_Store)$'
"  \ }

" 当尝试打开一个文件时，如果它已经在某个窗口被打开，CtrlP会尝试跳到那个窗口，而
" 不是新打开一个实例
"  e - 当 <cr> 被按下时跳转，但是只跳转到当前页签内的窗口内。
"  t - 当 <c-t> 被按下时跳转, 但是只跳转到其它标签的窗口内。
"  v - 类似 "e", 但是当 <c-v> 被按下时跳转。
"  h - 类似 "e", 但是当 <c-x> 被按下时跳转。
"  E, T, V, H - 行为类似 "e", "t", "v", and "h",
"  但是跳转到任何地方的窗口中。
"  0 或者 <empty> - 禁用这项功能。
  let g:ctrlp_switch_buffer = 'Et'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_settings = {
\ 'php' : {
\   'extends' : 'html',
\   'filters' : 'c',
\ },
\ 'xml' : {
\   'extends' : 'html',
\ },
\ 'haml' : {
\   'extends' : 'html',
\ },
\ 'javascript' : {
\   'snippets' : {
\     'jq' : "$(function() {\n\t${cursor}${child}\n});",
\     'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
\     'fn' : "(function() {\n\t${cursor}\n})();",
\     'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
\    },
\  }, 
\ 'html' : {
\   'filters' : 'html',
\   'indentation' : ' '
\  },
\ 'css' : {
\   'filters' : 'fc',
\},
\}




""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jquery.vim插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jquery.vim插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SirVer/ultisnips.vim插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" 设定自定义的snippet放置的目录
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch-easymotion 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch-fuzzy-easymotion 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/syntastic 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['syntastic-javascript-eslint']

" 过滤掉一些错误消息
" trimming 是空标签的警告，用于指示某些标签内没有任何内容
let g:syntastic_html_tidy_ignore_errors = ['trimming']


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置Lokaltog/vim-powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_colorscheme='solarized256'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置nathanaelkane/vim-indent-guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置kshenoy/vim-signature
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置majutsushi/tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
" let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
" let g:tagbar_type_cpp = {
"     \ 'kinds' : [
"          \ 'c:classes:0:1',
"          \ 'd:macros:0:1',
"          \ 'e:enumerators:0:0', 
"          \ 'f:functions:0:1',
"          \ 'g:enumeration:0:1',
"          \ 'l:local:0:1',
"          \ 'm:members:0:1',
"          \ 'n:namespaces:0:1',
"          \ 'p:functions_prototypes:0:1',
"          \ 's:structs:0:1',
"          \ 't:typedefs:0:1',
"          \ 'u:unions:0:1',
"          \ 'v:global:0:1',
"          \ 'x:external:0:1'
"      \ ],
"      \ 'sro'        : '::',
"      \ 'kind2scope' : {
"          \ 'g' : 'enum',
"          \ 'n' : 'namespace',
"          \ 'c' : 'class',
"          \ 's' : 'struct',
"          \ 'u' : 'union'
"      \ },
"      \ 'scope2kind' : {
"          \ 'enum'      : 'g',
"          \ 'namespace' : 'n',
"          \ 'class'     : 'c',
"          \ 'struct'    : 's',
"          \ 'union'     : 'u'
"      \ }
" \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置grassdog/tagman.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagman_ignores = ['node_modules', '*vendor', '*.min.js', 'dist', 'css']
let g:tagman_ctags_binary = "jsctags"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置dyng/ctrlsf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置heavenshell/vim-jsdoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 允许交互式的使用prompt来填充param相关数据
let g:jsdoc_allow_input_prompt = 1
" 在交互式的prompt里面为function的description字段补充说明
let g:jsdoc_input_description = 1
