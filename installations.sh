sudo apt-get --purge remove expect
sudo apt-get --purge remove zsh
sudo apt-get --purge remove git-core
sudo apt-get --purge remove vim
sudo apt-get --purge remove curl

sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install vim
sudo apt-get install curl
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6
sudo apt-get install pylint
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

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/chrisbra/vim-commentary ~/.vim/bundle/vim-commentary
git clone git://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
sudo shutdown -r 0
