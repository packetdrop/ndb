#
# This Dockerfile generates an Ubuntu based image that contains networking
# tools, that user can use to debug the networking issue or to generate the
# networking workload using the tools like iperf, tcpreplay etc.

# Following tools are already present with the base Ubuntu image and can be 
# very useful in debugging networking issues.
# ss, netstat, ping, ip, ifup, ifdown, ifquery, route, nmcli, nc, tcpdump, host, dig

FROM ubuntu:22.04

USER root

ENV PYTHONDONTWRITEBYTECODE yes

RUN INSTALL_PKGS=" \
	net-tools \
	traceroute \
	ethtool \
	mtr \
	iperf \
	nmap \
	strace \
	socat \
	iproute2 \
	wireshark \
	netperf \
	nmon \
	bmon \
        " && \
	apt-get -y update; apt-get install -y $INSTALL_PKGS

RUN apt clean all && rm -rf /var/cache/apt/*
WORKDIR /root
CMD [ "sleep", "100000" ]