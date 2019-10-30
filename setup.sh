# configration
mkdir ~/.config
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/kitty ~/.config/kitty

# git
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

# zshrc
ln -s ~/.dotfiles/zshrc/.zshrc ~/.zshrc

# ctags
ln -s ~/.dotfiles/.ctags ~/.ctags

# brew
brew bundle

# skicka
go get github.com/google/skicka
cd ~/go && go build -o ~/go/bin/skicka
~/go/bin/skica -no-browser-auth ls
~/go/bin/skicka download .dotfiles/.skk-jisyo ~/.dotfiles/.skk-jisyo
