# iKOS docker image

[iKOS](https://ikos.cvut.cz/ikoshtml/kos.html) docker image based on Ubuntu 18.04 and Oracle Java.

## Build

Download the specific Java installation file suggested by VIC (currently `jdk-8u212-linux-x64.tar.gz`)
and place it into the directory with Dockerfile.
Then build the image.

```
docker build -t kos .
```

## Run

```
./run.sh
```

# NOTE

[This link](https://github.com/frekele/oracle-java/releases) might be useful.

