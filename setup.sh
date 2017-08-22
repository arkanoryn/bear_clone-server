sudo apt install zsh
sudo apt install emacs

echo "alias imix=\"iex -S mix\"" >> ~/.zshrc
echo "alias ne=\"emacs -nw\"" >> ~/.zshrc
echo "alias reload_rc=\"source ~/.zshrc\"" >>  ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
