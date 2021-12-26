#!/bin/bash 

# Script to backup dotfiles 
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

#neovim
function bk_neovim(){
  echo -e "\nCopiando Configuracion de neovim";
	cp -rfT ~/.config/nvim/ .config/nvim

}

#vim
function bk_vim(){
	echo -e "\nCopiando Configuracion de vim";
	cp -rf ~/.vim/ .
	cp ~/.vimrc .
}

#bashrc
function bk_bashrc(){
	echo -e "\nCopiando Configuracion de .bashrc";
	cp ~/.bashrc .
}

#Qtiles
function bk_qtile(){
	echo -e "\nCopiando Configuracion de Qtiles";
	cp -rfT ~/.config/qtile/ .config/qtile
  echo -e "\nCopiando Configuracion de picom";
	cp -rfT ~/.config/picom/ .config/picom
}

#kitty terminal emulator
function bk_kitty(){
	echo -e "\nCopiando Configuracion de kitty";
	cp -rfT ~/.config/kitty/ .config/kitty
}

#Alacritty terminal emulator
function bk_alacritty(){
	echo -e "\nCopiando Configuracion de alacritty";
	cp -rfT ~/.config/alacritty/ .config/alacritty
}

#Ranger terminal file explorer
function bk_ranger(){
	echo -e "\nCopiando Configuracion de ranger";
	cp -rfT ~/.config/ranger/ .config/ranger
}

#Main function
function main(){
	echo "Respaldando dotfiles";
  echo -e "\nCreando .config";
  mkdir -vm 775 .config

  echo -e "[?] Respaldar ~/.bashrc (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_bashrc
	fi

  echo -e "[?] Respaldar ~/.vimrc and vim files (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_vim
	fi

 echo -e "[?] Respaldar ~/.config/nvim and neovim files (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_neovim
	fi

	echo -e "[?] Respaldar ~/.config/qtile (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_qtile
	fi

	echo -e "[?] Respaldar ~/.config/kitty (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_kitty
	fi
	
  echo -e "[?] Respaldar ~/.config/alacritty (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_alacritty
	fi

	echo -e "[?] Respaldar ~/.config/ranger (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		bk_ranger
	fi

}

#Call main function
main
#Call git 
git -v >& /dev/null
if [ $? -ne 0 ]; then
	#Git is installed 
	#Call git diff 
	echo -e "[?] Mostrar git diff (y/n)";
	read -n1 option
	if [ "$option" == "y" ]; then
		git diff	
	fi

fi

echo -e "\nFin del Script";
