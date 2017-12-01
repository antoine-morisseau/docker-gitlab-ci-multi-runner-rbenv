FROM gitlab/gitlab-runner:latest
MAINTAINER Antoine Morisseau <antoine@morisseau.me>

RUN apt-get update

# install build essentials
RUN apt-get install -y --no-install-recommends \
        git-core \
        curl \
		autoconf \
		automake \
		bzip2 \
		file \
		g++ \
		gcc \
		imagemagick \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libevent-dev \
		libffi-dev \
		libglib2.0-dev \
		libjpeg-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmysqlclient-dev \
		libncurses-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		xz-utils \
		zlib1g-dev

RUN git clone https://github.com/rbenv/rbenv.git ${HOME}/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"\neval "$(rbenv init -)"' > ${HOME}/.bashrc

RUN locale-gen en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV REGISTER_NON_INTERACTIVE=true
ENV REGISTRATION_TOKEN=
ENV CI_SERVER_URL=
ENV RUNNER_NAME=ruby
ENV RUNNER_EXECUTOR=shell
ENV RUNNER_TAG_LIST=ruby
ENV RUNNER_LIMIT=1

RUN gitlab-runner register
