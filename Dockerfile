FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y zlib1g-dev openssl pkg-config git libproxy-dev trousers p11-kit libp11-dev libstoken1 libpcsclite-dev build-essential libtool automake gettext libxml2-dev
ADD . /src
ADD vpnc-script /etc/vpnc/vpnc-script
WORKDIR /src
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
ENV LD_LIBRARY_PATH /usr/local/lib
