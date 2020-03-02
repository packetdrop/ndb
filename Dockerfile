#
# This Dockerfile generates an centos based image that contains networking
# tools, that user can use to debug the networking issue or to generate the
# networking workload using the tools like iperf, tcpreplay etc.
# Currently this image includes following networking tools
# iperf
# tcpreplay
# nmon
# arp
# net-tools (ifconfig, etc)
# bind-utils (nslookup)

# Following tools are already present with the base centos image and can be 
# very useful in debugging networking issues.
# ss
# netstat
# ping
# ip
# ifup
# ifdown
# ifquery
# route
# nmcli
# nc
# tcpdump
# host
# dig
#
#

FROM centos:centos7.7.1908

USER root

ENV PYTHONDONTWRITEBYTECODE yes

RUN yum -y update
RUN yum -y install epel-release
RUN INSTALL_PKGS=" \
	net-tools \
	traceroute \
	ethtool \
	mtr \
	iperf \
	nmap \
	strace \
	socat \
	iproute \
	bind-utils \
	wireshark \
	nmon \
	bmon \
	openssl \
        " && \
	yum install -y --setopt=skip_missing_names_on_install=False $INSTALL_PKGS

RUN yum clean all && rm -rf /var/cache/yum/*

RUN mkdir -p /root/scripts/
COPY ./scripts/init-script.sh /root/scripts/
WORKDIR /root
ENTRYPOINT /root/init-script.sh
