#!/bin/bash
#dfdfgfdg  w
# Script to install dotfiles
# Copyright (C) 2016 4L3J4NDR0 4N4Y4 (energy1011[4t]gmail[d0t]com)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# hola mundo

#Install zsh shell with oh-my-zsh
function zsh_config(){
    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	#install fzf-zsh wraper
	git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
	${ZSH}/custom/plugins/fzf/install --bin
	git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh
	#install powelevel10k prompt for zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
}

#Install powerline for shell and its fonts
function powerline_config(){
    sudo apt install python-pip
    sudo apt install python3-pip
    pip install powerline-status
    ## download fonts for powerline
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    sudo mv PowerlineSymbols.otf /usr/share/fonts/
    #Next, you need to update your system’s font cache as follows.
    sudo fc-cache -vf /usr/share/fonts/
    #Now install the fontconfig file.
    sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
}

#Install tmux config file
function tmux_config(){
	echo "\n[i] Copying .tmux.conf to ~/";
	cp .tmux.conf ~/
}

#Config git
function git_config(){
	echo "[i] Configuring git";
	#set git global ignore
	cat << EOF > ~/.gitignore
*~
*.un~
EOF
git config --global core.excludesfile '~/.gitignore'
git -v >& /dev/null 
if [ $? -ne 0 ]; then
	#Git is installed :)
	echo "Type your git user.name"
	read name
	#Set git config
	git config --global user.name $name
	echo "Type your git user.email"
	read email
	git config --global user.email $email
	#Set default editor vi
	git config --global core.editor vi
fi
}

function bashrc(){
	echo "Copying .bashrc";
	cp .bashrc ~/
}

function zshrc(){
	echo "Copying .zshrc";
	cp .zshrc ~/
}

function p10k(){
	echo "Copying .p10k.zsh";
	cp .p10k.zsh ~/
}

function i3_setup(){
	i3 -v >& /dev/null
	if [ $? -eq 0 ]; then
		echo -e "\n[i] Copying .i3/config";
		#silent call
		cp -r .config/i3 ~/.config/i3
		cp -r .config/i3status ~/.config/i3status
	else
		echo "[!] i3 is not installed";
		echo "[!] sudo apt-get install ";
		sudo apt install i3
		sudo apt install i3status
                ## install some tools to work with i3
                sudo apt install feh rofi xsettingsd compton copyd nm-applet
		#Call itself
		i3_setup
	fi
}

function atom_setup(){
	atom -v >& /dev/null
	if [ $? -eq 0 ]; then
		echo -e "\n[i] Copying .atom/config.cson";
		#silent call
		cp .atom/config.cson ~/.atom/
		echo -e "\n[i] Copying .atom/keymap.cson";
		cp .atom/keymap.cson ~/.atom/
	else
		echo "[!] atom is not installed";
	fi
}

function vim_setup(){
	echo -e "\n[i] Copying .vim files";
	#vim folders
	cp -rf .vim/colors ~/.vim/
	cp -rf .vim/autoload ~/.vim/
	#vimrc config file
	cp .vimrc ~/
	#install plugins	
	mkdir ~/.vim/bundle

	echo -e "[!] Ready to install vim plugins...";

	echo -e "[?] Install editorconfig-vim (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/editorconfig/editorconfig-vim
	fi

	echo -e "[?] Install ctrl (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrl.vim
	fi

	echo -e "[?] Install nerdtree (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	fi

	echo -e "[?] Install airline (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
	fi

	echo -e "[?] Install git fugitive (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
	fi

	echo -e "[?] Install vimux (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/benmills/vimux ~/.vim/bundle/vimux
	fi

	echo -e "[?] Install vim-tmux-navigator (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/bundle/vim-tmux-navigator
	fi

	echo -e "[?] Install multiple-cursors(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/vim-multiple-cursors
	fi

	echo -e "[?] Install snipmate(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		#Snippets plugin
		git clone https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim
		git clone https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils 
		git clone https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate

		echo -e "[?] Install optional snippets collection (y/n)";
		read -n1 option
		#optional snippets collection
		if [ "$option" == "y" ]; then
			git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
			#cp my custom snippet
			cp -rf .vim/bundle/vim-snippets/snippets/_.snippets ~/.vim/bundle/vim-snippets/snippets/_.snippets
		fi

	fi

	echo -e "[?] Install emmet(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim
	fi

	echo -e "[?] Install surround(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
	fi

	echo -e "[?] Install easymotion(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/easymotion/vim-easymotion.git ~/.vim/bundle/vim-easymotion
	fi

	echo -e "[?] Install airline (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
	fi

	echo -e "[?] Install tabular(y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
	fi
}

function main(){
	echo "[i] Installing dotfiles";

	#bashrc
	echo -e "[?] Copy .bashrc (y/n)";
	read -n1 option 
	if [ "$option" == "y" ]; then
		bashrc
	fi


        #oh-my-zsh
	echo -e "\n[?] Install oh-my-zsh (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		zsh_config
	fi

	#zshrc
	echo -e "[?] Copy .zshrc (y/n)";
	read -n1 option 
	if [ "$option" == "y" ]; then
	        zshrc
	fi

	#p10k
	echo -e "[?] Copy .p10k.zsh (y/n)";
	read -n1 option 
	if [ "$option" == "y" ]; then
	       p10k
	fi


	#i3
	echo -e "\n[?] Copy .i3/config (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		i3_setup
	fi

	#vim
	echo -e "\n[?] Setup files .vim (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		vim_setup
	fi

	#atom
	echo -e "\n[?] Setup files .atom (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		atom_setup
	fi


	#Git
	echo -e "\n[?] Set git config (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git_config
	fi

#	echo -e "\n[?] Set powerline for shell  (y/n)";
#	read -n1 option
#	if [ "$option" == "y" ]; then
#		powerline_config
#	fi
#
	echo -e "\n[?] Set tmux config (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		tmux_config
	fi

	echo "";

}

#Call to main function
main
