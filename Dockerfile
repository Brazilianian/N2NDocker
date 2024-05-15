FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
    autoconf \
    build-essential \
    libssl-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone https://github.com/lukablurr/n2n_v2_fork.git
WORKDIR /root/n2n_v2_fork
RUN make && make install
RUN rm -rf /root/n2n_v2_fork

EXPOSE 9000

CMD ["/usr/sbin/supernode", "-l", "9000", "-v", "-f"]
