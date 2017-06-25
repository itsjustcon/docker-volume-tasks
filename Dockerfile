# hub.docker.com/r/itsjustcon/volume-tasks
# ========================================
# HOW TO BUILD:
#   docker build --pull --tag itsjustcon/volume-tasks:latest .
# HOW TO DEPLOY:
#   docker push itsjustcon/volume-tasks:latest

FROM alpine

VOLUME /mnt/vol

RUN apk update &&\
    apk add bash curl rsync tar

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/docker-entrypoint.sh"]
#ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]
