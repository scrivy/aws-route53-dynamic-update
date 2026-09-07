FROM docker.io/library/alpine:3.24
RUN apk add -U aws-cli
RUN adduser -S aws -s /bin/ash -h /aws
ADD ./aws-route53-dynamic-update.sh /usr/local/bin/aws-route53-dynamic-update.sh
USER aws
ENV PATH=$PATH:/aws/.local/bin
WORKDIR /aws
ENTRYPOINT ["/usr/local/bin/aws-route53-dynamic-update.sh"]
