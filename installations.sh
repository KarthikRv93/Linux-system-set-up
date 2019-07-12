#!/usr/bin/env bash
remove_all ()
{
    sudo apt-get --purge remove expect
    sudo apt-get --purge remove zsh
    sudo apt-get --purge remove git-core
    sudo apt-get --purge remove vim
    sudo apt-get --purge remove curl
}
general ()
{
    sudo apt-get install zsh  -y
    sudo apt-get install git-core -y
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    chsh -s `which zsh`
    ubuntu-drivers devices
    sudo ubuntu-drivers autoinstall -y
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt-get update -y
    sudo apt-get install vim -y
    sudo apt-get install curl -y
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get install vim-gnome -y
    sudo apt-get update -y
    sudo apt-get install python3.6 -y
    sudo apt-get install pylint -y
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
    git clone https://github.com/KarthikRv93/Linux-system-set-up.git
    cp ~/Linux-system-set-up/.vimrc ~/
    git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/ervandew/supertab ~/.vim/bundle/supertab
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    cd ~
}

conda ()
{
    cd /tmp
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    sha256sum Anaconda3-2019.03-Linux-x86_64.sh
    bash Anaconda3-2019.03-Linux-x86_64.sh
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    cd ~
}

docker ()
{
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    sudo apt-cache policy docker-ce
    sudo apt install docker-ce
    sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
}

if [ "$1" = "general" ]; then
    if [ "$2" = "fresh" ]; then
        remove_all
    fi
    general
elif [ "$1" = "docker" ]; then
    docker
elif [ "$1" = "conda" ]; then
    conda
fi
