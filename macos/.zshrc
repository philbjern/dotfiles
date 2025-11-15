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
alias mx='tmux attach'
alias matrix='cmatrix -u 8'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'
alias g=git
alias gst='git status'
alias fetch='fastfetch' 

alias so='source ~/.zshrc'

#
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
	# Go to home directory, clear console and run fetch and display current weather
	cd ~/dev
	fetch
	weather
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

export PATH="/usr/local/sbin:$PATH"

cat ~/banner
