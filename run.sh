#!/bin/bash
xhost +local:docker

docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -e XAUTHORITY=/home/kokos/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.Xauthority:/home/kokos/.Xauthority \
  --user kokos \
  kos \
  bash -c 'java -version && javaws -verbose -wait https://ikos.cvut.cz/ikoshtml/jnlp/jnlp.php?serve=kos_cvut.jnlp'

xhost -local:docker

