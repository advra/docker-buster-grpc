FROM balenalib/raspberry-pi-debian:latest

RUN export MY_INSTALL_DIR=$HOME/.local
RUN export PATH="$PATH:$MY_INSTALL_DIR/bin"

RUN apt-get update && apt-get install -y  --no-install-recommends \
  cmake \
  build-essential \
  autoconf \
  libtool \
  pkg-config \
  automake \
  curl \
  libz-dev \
  git \

RUN apt-get install -y apt-transport-https ca-certificates
RUN update-ca-certificates

RUN git clone --recurse-submodules -b v1.33.1 https://github.com/grpc/grpc
WORKDIR /grpc/cmake
RUN mkdir build
WORKDIR /grpc/cmake/build
RUN cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../..
RUN make -j 2 # set to 2 or may run out of memory!
RUN make install

# clean any artifacts to reduce size
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /
