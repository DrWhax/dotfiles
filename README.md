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
    
    $ stow neovim tmux

## For MacOS

    $ stow neovim zsh-mac

# Mac specific:

* iTerm2 profile needs to be manually loaded

Requirements: GNU/Stow
