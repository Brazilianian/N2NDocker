FROM alpine:3.20

ARG N2N_PORT=9000
ENV N2N_PORT=${N2N_PORT}

RUN apk add \
    autoconf \
    alpine-sdk \
    libressl-dev \
    git \
    make \
    linux-headers

WORKDIR /root
RUN git clone https://github.com/lukablurr/n2n_v2_fork.git
WORKDIR /root/n2n_v2_fork
RUN make install
RUN rm -rf /root/n2n_v2_fork

EXPOSE $N2N_PORT

CMD ["sh", "-c", "/usr/sbin/supernode -l $N2N_PORT -v -f"]
