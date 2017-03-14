# Path to your oh-my-zsh installation.
export ZSH=/Users/wangxing/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# Optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the “user@hostname” info when you’re logged in as yourself on your local machine.
DEFAULT_USER="wangxing"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow bower brew node npm nvm grunt autojump frontend-search web-search osx)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$(brew --prefix php55)/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
#
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/wangxing/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

source $ZSH/oh-my-zsh.sh


# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
AUTOSUGGESTION_HIGHLIGHT_CURSOR=1
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=250'

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gmnf="git merge --no-ff"

export NVM_DIR="/Users/wangxing/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# 通过brew安装的vim7.4 替代系统的vim7.3
alias vim="/usr/local/Cellar/vim/7.4.898/bin/vim"

# 把vim粘贴到~/vim-clipboard里面的文件拷贝到剪贴板上
alias cpvim="pbcopy < ~/vim-clipboard"

# 查找我的IP
alias myip="ifconfig | ag 192\.168"

# 更新DNS缓存
alias freshDns="sudo killall -HUP mDNSResponder"

# 删除当前目录下的 .DS_Store
alias rmDS="find . -name '.DS_Store' -depth -exec rm {} \\;"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# 调用通过homebrew安装的ctags而不是系统的/usr/bin/ctag
alias ctags="`brew --prefix`/bin/ctags"
# 为vim生成当前项目下的ctags文件，不包括node_modules文件
alias makeCtags="find . -type f -iregex '.*\.js$' -not -path './node_modules/*' -exec jsctags {} -f \; | sed '/^$/d' | sort > tags"
# 为vim生成当前项目下的ctags文件，包括node_modules文件
alias makeCtagsAll="find . -type f -iregex '.*\.js$' -exec jsctags {} -f \; | sed '/^$/d' | sort > tags"
# 使得BeyondCompare可以无限永久试用,在过期的时候执行一次
alias updateBeyondCompare="rm \"/Users/$(whoami)/Library/Application Support/Beyond Compare/registry.dat\"" 

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"



#alias for cnpm
# alias cnpm="npm --registry=https://registry.npm.taobao.org \
#   --cache=$HOME/.npm/.cache/cnpm \
#   --disturl=https://npm.taobao.org/dist \
#   --userconfig=$HOME/.cnpmrc"
#
# export PATH="$HOME/.yarn/bin:$PATH"
