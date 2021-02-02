export PATH="$HOME/bin:$PATH"
export PS1='\[\e[36m\]\w \[\e[0m\]# '

# apt aliases
alias up='apt update && apt upgrade -y'
alias it='apt install -y'
alias rmf='apt autoremove -y --purge'

# improve ls command
alias ls='ls --color --group-directories-first'

# shortcut to run bionic
bionic() {
	clear
	echo -e '\e[32m--- BIONIC ---\e[0m'
	cd ~/bionic
	npm start
}

# create directory and cd into it
mkcd() {
	if [[ "$*" ]]; then
		mkdir "$*"
		cd "$*"
	else
		echo 'No name specified.'
	fi
}

# remove current directory
rmpwd() {
	echo -e "Do you really want to remove \e[36m$PWD\e[0m?"
	local confirm
	read confirm
	if [[ "$confirm" =~ ^y(es?)?$ ]]; then
		rm -r "$@" "$PWD"
		cd ..
	fi
}
