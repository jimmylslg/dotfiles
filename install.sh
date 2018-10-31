cd ~

echo ""
echo "============= Dotfiles ============="
echo "" 

mkdir -p ~/.dotfiles_bak

echo ""
echo "*** Backing up existing dotfiles"
echo "" 

cp ~/.tmux.conf ~/.dotfiles_bak
cp ~/.vimrc ~/.dotfiles_bak
cp ~/.zshrc ~/.dotfiles_bak

echo ""
echo "*** Finished bakcing up"
echo "" 

echo ""
echo "*** Copying latest dotfiles"
echo "" 

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo ""
echo "*** dotfiles are the latest now!"
echo "" 

# echo ""
# echo "============= Plugins ============="
# echo "" 
# 
# export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
# 
# # Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# 
# #Plugin Installs
# 
# # zsh_autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 
# # zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 
# # autojump
# git clone git://github.com/wting/autojump.git $ZSH_CUSTOM/plugins/autojump 
# cd  $ZSH_CUSTOM/plugins/autojump && ./uninstall.py && ./install.py
# cd -
# 
# echo ""
# echo "*** Finished. Please reload config."
# echo ""
