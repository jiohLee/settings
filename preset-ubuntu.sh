#! /bin/bash

# force color
sudo sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc && source ~/.bashrc

# update mirror repository
sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/' /etc/apt/sources.list
apt update

# install mandatories
apt install -y \
		openssh-server \
		git \
		vim \
		gcc \
		g++ \
		curl \
		net-tools \
		make \
		cmake \
		xutils-dev \
		htop \

# git configuration
git config --global user.email "jiosiro@gmail.com"
git config --global user.name "jiohLee"
git config --global credential.helper store

# vim configuration
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo -e "set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

set nu
set ts=4
set sw=4
set ls=2
set cindent"> ~/.vimrc

vim +PluginInstall +qall

echo -e "set nu
set ts=4
set sw=4
set ls=2
set cindent

colorscheme onehalfdark
let g:airline_theme='onehalfdark'
highlight Normal ctermfg = white ctermbg = NONE
highligh LineNr ctermbg = NONE

nmap <C-b> :NERDTreeToggle<CR>
nnoremap <Esc>[1;5C :tabnext<CR>
nnoremap <Esc>[1;5D :tabprevious<CR>" >> ~/.vimrc
soucre $HOME/.bashrc
