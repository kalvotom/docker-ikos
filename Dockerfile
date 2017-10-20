#
# Run iKOS in docker container.
#
# Based on:
#
# Oracle Java 8 Dockerfile
#
# https://github.com/cogniteev/docker-oracle-java
# https://github.com/cogniteev/docker-oracle-java/tree/master/oracle-java8
#

# Pull base image.
FROM ubuntu:16.04
MAINTAINER tomas.kalvoda@fit.cvut.cz

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install X11.
RUN \
  apt-get update && \
  apt-get install -y xorg xterm

# Install Firefox
RUN \
  apt-get update && \
  apt-get install -y firefox

# Add user
RUN useradd -ms /bin/bash kokos
USER kokos

# Define working directory.
WORKDIR /home/kokos
RUN mkdir -p /home/kokos/Downloads

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

