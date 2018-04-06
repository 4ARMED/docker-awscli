FROM alpine:3.7
LABEL maintainer="Marc Wickenden <marc@4armed.com>"

RUN addgroup -g 1000 -S awscli && \
    adduser -u 1000 -S awscli -G awscli 

RUN apk --update add python py-pip && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /home/awscli/.aws
USER awscli

ENTRYPOINT ["aws"]


