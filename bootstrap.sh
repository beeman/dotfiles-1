#!/bin/sh
#a

# Tells the shell script to exit if it encounters an error
set -e

# -- Log -----------------------------------------------------------------------
# Duplicated code from log.sh
# since we cannot import a file when installing via cURL
function msg {
	echo  "\033[0;37m$1\033[0m";
}

function msg_ok {
	echo  "➜\033[1;32m $1 ✔\033[0m";
}

function msg_run {
	echo  "➜\033[1;35m $1  $2\033[0m";
}

msg '\n'

msg_ok '      _       _    __ _ _             _ _ _ '
msg_ok '     | |     | |  / _(_) |           | | | |'
msg_ok '   __| | ___ | |_| |_ _| | ___  ___  | | | |'
msg_ok '  / _` |/ _ \| __|  _| | |/ _ \/ __| | | | |'
msg_ok ' | (_| | (_) | |_| | | | |  __/\__ \ |_|_|_|'
msg_ok '  \__,_|\___/ \__|_| |_|_|\___||___/ (_|_|_)'

msg '\n'



msg '                by @vsouza'
msg '\n'

# -- Homebrew ------------------------------------------------------------------
if hash brew 2> /dev/null; then
	msg_ok "homebrew"
else
	msg_run "homebrew" "ruby -e '$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)'"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# -- Git -----------------------------------------------------------------------
if hash git 2> /dev/null; then
	msg_ok "git"
else
	msg_run "git"
	brew install git 2> /dev/null
fi

# -- Golang -----------------------------------------------------------------------
if hash go 2> /dev/null; then
	msg_ok "golang"
else
	msg_run "golang"
	brew install go 2> /dev/null
fi


# -- Dotfiles ------------------------------------------------------------------
if [[ -d "$HOME/.dotfiles" ]]; then
	msg_ok "dotfiles"
else
	msg_run "dotfiles" "git clone https://github.com/vsouza/dotfiles.git $HOME/.dotfiles"
	git clone https://github.com/vsouza/dotfiles.git $HOME/.dotfiles
fi

# -- Installers ----------------------------------------------------------------
# Find the installers and run them iteratively
cd "$HOME/.dotfiles/$(dirname $)"/..
find . -name setup.sh | while read installer ; do sh -c "${installer}" ; done
