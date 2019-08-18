# .dotfiles
Version control of vim script for neovim, zshrc.

# Install
git clone https://github.com/TsuMakoto/.dotfiles.git ~/.dotfiles

# Required
- works with the version of neovim 0.4.0.
- pyenv
  - anaconda3-5.3.1
    - python2.x (this env named nvim2)
    - python3.x (this env named nvim3)

- git

# How do I get set up?
```
### Install git
sudo apt-get install git
git --version
git version xx.yy.zz

### Install neovim.
# For ubuntu
add repos for neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
neovim --version

# For macOS (required Homebrew)
brew install neovim

### Install Python
# Install pyenv or virtualenv.
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# Install anaconda3-5.3.1
pyenv install anaconda3-5.3.1

# Install python2
pyenv activate anaconda3-5.3.1
conda create nvim2 -n python=2.x
pyenv activate nvim2
pip install neovim

# Install python3
pyenv activate anaconda3-5.3.1
conda create nvim3 -n python=3.x
pyenv activate nvim3
pip install neovim
```
# How to use?
sh init.sh
Please linked '[git clone directory]/.dotfiles/vim/init.vim' to '~/.config/nvim/init.vim'.
```
ln -s [git clone directory]/.dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -s [git clone directory]/.dotfiles/vim/colors ~/.config/nvim/colors
```
## Use onivim/oni
if you used onivim/oni instead of nvim, it is recommended linked to '[git clone directory]/.dotfiles/oni/config.tsx' to '~/.config/oni/config.tsx'.

## Use zshrc/.zshrc
if you this repository's .zshrc then linked to '[git clone directory]/.dotfiles/zshrc/.zshrc' to '~/.zshrc'.
