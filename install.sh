cd ~

echo ""
echo "============= Dotfiles ============="
echo "" 

mkdir -p ~/.dotfiles_bak
mkdir -p ~/.vim/undodir

echo ""
echo "*** Backing up existing dotfiles"
echo "" 

cp ~/.tmux.conf ~/.dotfiles_bak
unlink ~/.tmux.conf 
cp ~/.vimrc ~/.dotfiles_bak
unlink ~/.vimrc
cp ~/.zshrc ~/.dotfiles_bak
unlink ~/.zshrc

echo ""
echo "*** Finished bakcing up"
echo "" 


echo ""
echo "============= Plugins ============="
echo "" 
 

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"
 
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export SHELL=/bin/zsh

#Plugin Installs
 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

# zsh_autosuggestions
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

echo ""
echo "*** dotfiles are the latest now!"
echo "" 

echo | echo | vim +PluginInstall +qall
chsh -s /bin/zsh

echo ""
echo "*** Finished. Please kill the terminal to reload config."
echo ""
