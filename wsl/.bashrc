export PATH="$HOME/bin:$PATH"
export PS1='\[\e[36m\]\w \[\e[0m\]$ '
export WINHOME='/mnt/c/Users/Jan'

# apt aliases
alias up='sudo apt update && sudo apt upgrade -y'
alias it='sudo apt install -y'
alias rmf='sudo apt autoremove -y --purge'

# improve ls command
alias ls='ls --color --group-directories-first'

# shortcut to run bionic
bionic() {
	clear
	echo -e '\e[32m--- BIONIC ---\e[0m'
	cd $WINHOME/GitHub/bionic
	npm start
}

# clone github repositories
clone() {
	if [[ $1 ]]; then
		cd $WINHOME/GitHub
		git clone https://github.com/$1
		cd $(basename $1)
	else
		echo 'No repository specified.'
	fi
}

# create directory and cd into it
mkcd() {
	if [[ $1 ]]; then
		mkdir $1
		cd $1
	else
		echo 'No name specified.'
	fi
}

# restart bash
restart() {
	cd $WINHOME
	clear
	exec bash
}

# remove current directory
rmpwd() {
	echo -e "Do you really want to remove \e[36m$PWD\e[0m?"
	local confirm
	read confirm
	if [[ $confirm =~ ^y(es?)?$ ]]; then
		rm -r $@ $PWD
		cd ..
	fi
}
