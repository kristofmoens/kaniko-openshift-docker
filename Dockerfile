FROM gcr.io/kaniko-project/executor:v1.5.2

# Adapt dockerfile
FROM alpine
COPY --from=0 /kaniko/ /kaniko

RUN mkdir -p /cache && \
    apk add ca-certificates && \
    chmod g=u /etc/passwd && \
    chgrp -R 0 /kaniko /var /cache /etc /lib && \
    chmod -R g=u /kaniko /var /cache /etc /lib && \
    chmod a+x /uid_entrypoint

#COPY uid_entrypoint /
#ENTRYPOINT ["/uid_entrypoint"]
USER 1001
