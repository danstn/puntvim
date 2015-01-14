FROM ubuntu

MAINTAINER Daniel Stankevich

ENV DEBIAN_FRONTEND noninteractive

# Install vim, curl, git etc
RUN apt-get install -y vim curl wget git python

# Setup a vim user and locales
RUN useradd vimmer && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    cp /usr/share/zoneinfo/Australia/Melbourne /etc/localtime && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

WORKDIR /home/vimmer

ENV HOME /home/vimmer
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN chown -R vimmer:vimmer $HOME
USER vimmer

# Setup Pathogen
RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
RUN wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim

# Install Plugins
RUN git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree

# Copy vimrc inside the container
COPY ./vim-artifact/vimrc-docker $HOME/.vimrc
COPY ./vim-artifact/colors $HOME/.vim/colors
COPY ./vim-artifact/fonts $HOME/.vim/fonts
COPY ./vim-artifact/syntax $HOME/.vim/syntax
COPY ./vim-artifact/bundle/* $HOME/.vim/bundle/

ENTRYPOINT ["vim"]
