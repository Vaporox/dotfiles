# necessary stuff
source /usr/share/defaults/etc/profile
export PATH="$HOME/.dart/bin:$HOME/.deno/bin/$PATH"

# eopkg aliases
alias up='sudo eopkg up -y'
alias it='sudo eopkg it -y'
alias rmf='sudo eopkg rmf -y --purge'

# https://dev.getsol.us/T2043
alias code='code-oss'

# shortcut to run bionic
bionic() {
	clear
	echo -e '\e[1;32m--- BIONIC ---\e[0m'
	cd ~/GitHub/bionic
	npm start
}

# clear history
clh() {
	rm -f ~/.bash_history
	history -c
}

# clone github repositories
clone() {
	if [ $1 ]; then
		cd ~/GitHub
		git clone https://github.com/$1
		cd $(basename $1)
	else
		echo 'No repository specified.'
	fi
}

# create directory and cd into it
mkcd() {
	if [ $1 ]; then
		mkdir $1
		cd $1
	else
		echo 'No name specified.'
	fi
}

# mount boot partition
mount() {
	if [ $1 ] && [ $1 = boot ]; then
		sudo mount /dev/sda1 /boot
	else
		command mount $@
	fi
}

# restart bash
restart() {
	cd
	clear
	exec bash
}

# remove current directory
rmpwd() {
	echo -e "Do you really want to remove \"\e[1;34m$PWD\e[1;0m\"? (yes | y)"
	read CONFIRM
	if [ $CONFIRM ]; then
		if [ $CONFIRM = yes ] || [ $CONFIRM = y ]; then
			rm -r $@ $PWD
			cd ..
		fi
	fi
	unset CONFIRM
}

# unmount boot partition
umount() {
	if [ $1 ] && [ $1 = boot ]; then
		sudo umount /dev/sda1
	else
		command umount $@
	fi
}
