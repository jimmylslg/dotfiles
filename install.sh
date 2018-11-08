#!/bin/sh

#   #   #   #   #   #   #   #   #   #   #   #   #   #   
#
#           Things to do for new setup:
#
#   1: nvim should be installed and available in $PATH
#   2: virtualenv with Ptyhon3 should be created under
#       $HOME/.config/nvim/neovim_env
#   3: Pip3 in $PATH should installs Autopep8, flake8
#       pylint in case needed
#   4: Tmux is a plus
#   5: Install latest Universal Ctags
#        Link: https://github.com/universal-ctags/ctags
#   6: zsh needs to be installed
#
#   #   #   #   #   #   #   #   #   #   #   #   #   #   


echo ""
echo "============= Dotfiles ============="
echo "" 

mkdir -p ~/.dotfiles_bak
mkdir -p ~/.vim/undodir
mkdir -p ~/.config/nvim

echo ""
echo "*** Backing up existing dotfiles"
echo "" 

cp ~/.tmux.conf ~/.dotfiles_bak
unlink ~/.tmux.conf 
cp ~/.vimrc ~/.dotfiles_bak
unlink ~/.vimrc
cp ~/.zshrc ~/.dotfiles_bak
unlink ~/.zshrc
cp ~/.gitconfig ~/.dotfiles_bak
unlink ~/.gitconfig
cp ~/.config/nvim/init.vim ~/.dotfiles_bak
unlink ~/.config/nvim/init.vim

echo ""
echo "*** Finished bakcing up"
echo "" 

echo ""
echo "============= Plugins ============="
echo "" 

# Install oh-my-zsh (no interruption)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"
 
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export SHELL=/bin/zsh

# Install custom themes
curl -l https://raw.githubusercontent.com/AmrMKayid/KayidmacOS/master/kayid.zsh-theme -o \
    $ZSH_CUSTOM/themes/kayid.zsh-theme
curl -l https://raw.githubusercontent.com/dannynimmo/punctual-zsh-theme/master/punctual.zsh-theme -o \
    $ZSH_CUSTOM/themes/punctual.zsh-theme

# Install Vim Plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh_autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
 
# autojump
git clone git://github.com/wting/autojump.git $ZSH_CUSTOM/plugins/autojump 
cd  $ZSH_CUSTOM/plugins/autojump && ./uninstall.py && ./install.py
cd -
 
echo ""
echo "*** Copying latest dotfiles"
echo "" 

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

echo ""
echo "*** dotfiles are the latest now!"
echo "" 

# Install Vundle PlugIns
echo | echo | vim +PlugInstall +qall
echo | echo | nvim +PlugInstall +qall

# Set ZSH to be default shell
chsh -s /bin/zsh

echo ""
echo "*** Finished. Please kill the terminal to reload config."
echo ""
