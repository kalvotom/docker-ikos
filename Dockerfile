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
FROM ubuntu:18.04
MAINTAINER tomas.kalvoda@fit.cvut.cz

# Install Java.
COPY jre-8u212-linux-x64.tar.gz ./

RUN apt-get update

RUN \
  mkdir -p /opt/jre && \
  tar -xf jre-8u212-linux-x64.tar.gz -C /opt/jre && \
  update-alternatives --install /usr/bin/java java /opt/jre/jre1.8.0_212/bin/java 100 && \
  update-alternatives --install /usr/bin/javaws javaws /opt/jre/jre1.8.0_212/bin/javaws 100

# Install X11.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg xterm

# Install Firefox.
RUN apt-get install -y firefox

# Add user
RUN useradd -ms /bin/bash kokos
USER kokos

# Define working directory.
WORKDIR /home/kokos
RUN mkdir -p /home/kokos/Downloads

# Define commonly used JAVA_HOME variable
ENV JRE_HOME /opt/jre/jre1.8.0_212

# Define default command.
CMD ["bash"]

