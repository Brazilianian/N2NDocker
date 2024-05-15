FROM ubuntu:14.04

ARG N2N_PORT=9000
ENV N2N_PORT $N2N_PORT

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

EXPOSE $N2N_PORT

CMD ["/usr/sbin/supernode", "-l", "${N2N_PORT}", "-v", "-f"]
