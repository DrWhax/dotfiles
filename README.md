dotfiles
========

My dotfiles for:

* Debian Buster or higher
* Manjaro
* MacOS Catalina

# Install Brew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install Brew packages

    $ brew bundle

# Install  dotfiles

    $ git clone https://github.com/drwhax/dotfiles.git ~/.dotfiles

# Example:

## For Linux
    
    $ sudo apt install pylint pylint3 node yarn npm

    $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    $ stow neovim tmux

## For MacOS

    $ stow neovim zsh-mac

# Mac specific:

* iTerm2 profile needs to be manually loaded
* NeoVim's Jedi plugin can work but this advice should be followed: https://blog.cuffaro.com/blog/2018/04/16/pyenv-neovim 

# General

Requirements: GNU/Stow
