FROM debian:bullseye

MAINTAINER Chandra Lefta <lefta.chandra@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

#
#  Install build tools
#
RUN apt-get -y update
RUN apt-get install -y iproute2
RUN apt-get install -y git build-essential \
                           perl \
                           liblzma-dev \
                           mtools \
                           zlib1g-dev binutils-dev

RUN apt clean       
#
#  Shallow clone the iPXE
#
ARG source=https://github.com/ipxe/ipxe.git
ARG release=v1.21.1

ARG src_dir=/tmp/src/ipxe

RUN git clone --depth 1 --single-branch --branch ${release} ${source} ${src_dir}

ADD ipxe.sh /ipxe.sh
RUN chmod +x /ipxe.sh

ENTRYPOINT ["/ipxe.sh"]
CMD ["compile"]