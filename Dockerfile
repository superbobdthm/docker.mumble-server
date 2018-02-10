FROM ubuntu:16.04

MAINTAINER Douglas Mueller <superbob@dthm.net>
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository ppa:mumble/release
RUN apt-get update
RUN apt-get install -y mumble-server 
RUN apt-get clean && rm -Rf /var/lib/apt/lists

VOLUME ["/mumble-server"]

EXPOSE 64738:64738/udp 
CMD ["/usr/sbin/murmurd", "-ini", "/mumble-server/mumble-server.ini", "-fg"]
