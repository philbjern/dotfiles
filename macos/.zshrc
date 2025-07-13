# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="steeef"
 #ZSH_THEME="strug"
 #ZSH_THEME="fino-time"
 ZSH_THEME="fino"
# ZSH_THEME=bira
# ZSH_THEME=half-life
# ZSH_THEME=flazz

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status macos time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZLE_PROMPT_INDENT=0

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#     _    _ _
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/
# 
#
# Load .bash_aliases file
if [ -f ~/.bash_aliases ]; then
  ~/.bash_aliases
fi

alias vim='nvim'
alias viim='nvim'
alias fim='nvim'

alias python='python3'
alias pip='pip3'
alias clock='tty-clock -scB'
alias pipes='pipes.sh -p 4 -t 7 -f 30'
alias la='ls -la'
alias mx='tmux'
alias matrix='cmatrix -u 8'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'
alias g=git
alias gst='git status'
alias fetch='fastfetch' 

alias so='source ~/.zshrc'

#  _____                 _   _
# |  ___|   _ _ __   ___| |_(_) ___  _ __  ___
# | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _|| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
# 
#
# Push to ghpages branch (git-deploy) alias
export gitdeploy() {
	if [ -z "$1" ]
	then
		echo "Which folder do you want to deploy to GitHub Pages?"
		#exit 1
		return
	fi
	git subtree push --prefix $1 origin gh-pages
}

export weather() {
	# Fetch current temperature info from wttr.in API
	if [ -z "$1" ]
	then 
		curl "wttr.in/Bochnia?format=3"
	else
		city=$1
		cityUpper="$(tr '[:lower:]' '[:upper:]' <<< ${city:0:1})${city:1}"
		curl "wttr.in/$cityUpper?format=3"
	fi
}

export h() {
	# Go to home directory, clear console and run neofetch and display current weather
	cd ~/Dev
	neofetch
	weather
}

export GPT_HOME=~/github/gpt4all/chat
export gpt() {
	cd $GPT_HOME
	./gpt4all-lora-quantized-OSX-intel
}

~/.tokens

export artemis() {
	/Users/archloner/dev/bin/mybroker/bin/artemis $1
}

fg() {
	if [[ $# -eq 1 && $1 = - ]]; then
		builtin fg %-
	else
		builtin fg %"$@"
    fi
}

export DEFAULT_VENV=python

export venv() {
  if [ -z "$1" ]
  then
    source ~/.virtualenvs/$DEFAULT_VENV/bin/activate
  else
    source ~/.virtualenvs/$1/bin/activate
  fi
}

# source ~/.virtualenvs/python/bin/activate
venv

# Load Angular CLI autocompletion.
source <(ng completion script)

# Created by `pipx` on 2024-05-30 13:00:48
export PATH="$PATH:/Users/archloner/.local/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/sbin:$PATH"

cat ~/banner
