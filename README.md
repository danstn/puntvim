Punt Vim
========

Vim configuration, packages and color schemes.

# Installation

## Vim

To support `neocomplete` and system's clipboard integration - make sure that vim is installed with certain flags. Run `vim --version` to check your build.

### Mac OS

    brew install vim --with-lua --with-clipboard

## Configuration and Plugins

### Automatic

Run this script to pull this repo and install vim plugins automatically. 

Note: this will replace and backup your `.vimrc` and will attempt to destroy `.vim` directory. Eventially the repository will be pulled into `.vim`.
  
    curl https://raw.githubusercontent.com/dzotokan/puntvim/master/setup.sh | sh
    
### Manual

- Install Vundle: `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Place the contents of `vimrc` into `~/.vimrc` (you might want to back up your current one)
- Pull `colors` and `syntax` into `~/.vim/` for themes and syntax improvements
- Run `vim +PluginInstall +qall` to install plugins
