FROM ubuntu:15.10

RUN apt-get update
RUN apt-get install -y zlib1g-dev openssl pkg-config
RUN apt-get install -y libproxy-dev trousers p11-kit libp11-dev libstoken1 libpcsclite-dev
RUN apt-get install -y build-essential libtool automake
RUN apt-get install -y gettext libxml2-dev
ADD . /src
ADD vpnc-script /etc/vpnc/vpnc-script
WORKDIR /src
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
ENV LD_LIBRARY_PATH /usr/local/lib
