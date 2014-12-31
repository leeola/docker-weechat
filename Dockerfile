# DOCKER-VERSION 1.4.0
FROM centos:centos7
MAINTAINER Lee Olayvar <leeolayvar@gmail.com>


# ## Create the process user
RUN adduser weechatter \


# ## Install Weechat dependencies
  && yum install -y \
    gcc make cmake tar \
    ncurses-devel zlib-devel libgcrypt-devel libcurl-devel gnutls-devel \


# ## Install Weechat
  && cd /tmp \
  && export WEEVER="1.0.1" \
  && curl -O https://weechat.org/files/src/weechat-$WEEVER.tar.gz \
  && tar -zxvf weechat-$WEEVER.tar.gz \
  && mkdir weechat-$WEEVER/build \
  && cd weechat-$WEEVER/build \
  && cmake .. \
  && make \
  && make install \


# ## Cleanup
  && cd /tmp \
  && rm -rf weechat-$WEEVER weechat-$WEEVER.tar.gz


USER weechatter
WORKDIR /home/weechatter
CMD ["weechat"]
