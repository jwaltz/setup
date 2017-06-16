# update and install git and vim
sudo apt-get update
sudo apt-get install git vim curl

# install pathogen
mkdir -p ~/.vim/autoload/ ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# backup old dotfiles
cd $HOME
if [ -d ./dotfiles/ ]; then
  mv dotfiles dotfiles.old
fi

# pull and link new dotfiles
git clone https://github.com/jwaltz/dotfiles.git
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bashrc .
source ~/.bashrc

# set git user and email
git config --global user.name "Jonathan Waltz"
git config --global user.email "jon@waltzhome.com"

# set vim as default editor
# WARNING: command is specific to Debian-based systems
sudo update-alternative --config editor

# enable 256-colors terminal for distinguished colorscheme
export TERM=xterm-256

# install vim plugins with vundle
vim +PluginInstall +qall
