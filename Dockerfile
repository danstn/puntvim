FROM base

MAINTAINER Daniel Stankevich

# Install required packages
RUN apt-get install vim git curl -y

# Setup vim. See github page for more info
RUN curl https://raw.githubusercontent.com/dzotokan/puntvim/master/setup.sh | sh

CMD vim



