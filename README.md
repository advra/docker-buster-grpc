# Raspbeery Pi Debian Buster

This is an extension of [https://hub.docker.com/r/balenalib/raspberry-pi-debian/](Balenalib/raspberry-pi-debian) buster image with gRPC.

To Use:
In your dockerfile extend from this with the following:
```FROM asdfadrian/rpi-buster-grpc```

Build The Container
```
docker build -it -t grpc-image
docker run -it --rm --name my-grpc-app
```