FROM ubuntu

MAINTAINER Daniel Stankevich

ENV DEBIAN_FRONTEND noninteractive

# Install vim, curl, git etc


RUN apt-get install -y curl wget git python
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y neovim

# Setup a vim user and locales
RUN useradd vimmer && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    cp /usr/share/zoneinfo/Australia/Melbourne /etc/localtime && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

WORKDIR /home/vimmer/mnt

ENV HOME /home/vimmer
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN chown -R vimmer:vimmer $HOME
USER vimmer

# Setup Pathogen
RUN mkdir -p $HOME/.nvim/autoload $HOME/.nvim/bundle
RUN wget -P $HOME/.nvim/autoload https://tpo.pe/pathogen.vim

# Deploy vim artifact
COPY ./vim-artifact/vimrc-docker $HOME/.nvimrc
COPY ./vim-artifact/colors $HOME/.nvim/colors
COPY ./vim-artifact/fonts $HOME/.nvim/fonts
COPY ./vim-artifact/syntax $HOME/.nvim/syntax
COPY ./vim-artifact/bundle $HOME/.nvim/bundle

ENTRYPOINT ["nvim"]
