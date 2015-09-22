Punt Vim
========

Vim configuration, packages and color schemes.

# Installation

## Vim

To support `neocomplete` and system's clipboard integration - make sure that vim is installed with certain flags. Run
`vim --version` to check your build.

### OS X

    brew install vim --with-lua --with-clipboard

## Configuration and Plugins

_Note:_ YCM plugin requires Python2, cmake and make. Make sure these are installed otherwise it will fail. Installation
script is in `~/.vim/bundle/YouCompleteMe`.(`install.py`)

### Automatic

Run this script to pull this repo and install vim plugins automatically.

Note: this will replace and backup your `.vimrc` and will attempt to destroy `.vim` directory. Eventially the repository
will be pulled into `.vim`.

    curl https://raw.githubusercontent.com/dzotokan/puntvim/master/setup.sh | sh

### Manual

- Install Vundle: `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Place the contents of `vimrc` into `~/.vimrc` (you might want to back up your current one)
- Pull `colors` and `syntax` into `~/.vim/` for themes and syntax improvements
- Run `vim +PluginInstall +qall` to install plugins

## Vim in Docker

_Using basic vim configuration (`vimrc-basic`) is recommended if you want to run Vim in Docker. Use `vim -u` to specify
a custom configuration file for vim_

### OS X

Make sure you have `boot2docker` to be able to run this container. For auto loading export docker env variables in your
shell rc file. Run `boot2docker up` to start a VM for Docker (each per shell session).

## Getting the container

You can pull from Docker Hub

    docker pull dzotokan/vim

..or build locally

    ./docker/build.sh

## Running the container

Note: this is work in progress and far from being robust yet.

To run Vim off the docker container use `run-container.sh`. Could be aliased to `vim` or `vimc` (Vim in container; i.e.
`alias vimc="~/.vim/docker/run-container.sh"`).

    ./docker/run-container.sh

It will mount $HOME and change the working directory to the current one. `--rm` is put to shut down the container when
Vim quits, so you don't have to stop the container. See `Dockerfile` for details.

## Issues

- Having YCM plugin enabled causes a `sigterm` in `.rb` files after entering `::` or `..` while in Insert mode using Vim
  v7.4. Does not happen in MacVim (`mvim -v`)
