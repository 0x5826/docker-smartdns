FROM debian:buster-slim AS builder

RUN apt update && \
    apt install -y git make gcc libssl-dev && \
    git clone -b Release34 https://github.com/pymumu/smartdns.git --depth 1 && \
    cd smartdns && \
    sh package/build-pkg.sh --platform linux --arch x86-64 --static && \
    mv src/smartdns /usr/sbin

FROM alpine:latest

LABEL maintainer="dante <0x5826@gmail.com>"

COPY --from=builder /usr/sbin/smartdns /usr/sbin/smartdns

RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
RUN apk del tzdata

EXPOSE 53/udp
EXPOSE 53/tcp

VOLUME "/etc/smartdns"

CMD ["/usr/sbin/smartdns", "-f", "-x"]