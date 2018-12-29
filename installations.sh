sudo apt-get --purge remove expect
sudo apt-get --purge remove zsh
sudo apt-get --purge remove git-core
sudo apt-get --purge remove vim
sudo apt-get --purge remove curl

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
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

sudo shutdown -r 0
