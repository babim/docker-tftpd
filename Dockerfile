FROM babim/alpinebase

RUN apk add --no-cache tftp-hpa && \
    mkdir -p /share

EXPOSE 69/udp

VOLUME /share

ENTRYPOINT ["in.tftpd"]

CMD ["-L", "--verbose", "-u", "root", "--secure", "--create", "/share"]
