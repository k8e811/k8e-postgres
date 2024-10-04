ARG DOCKER_POSTGRESQL_TAG=17
FROM postgres:${DOCKER_POSTGRESQL_TAG}
ENV TERM xterm-256color
ENV PAGER mypager
RUN apt-get update\
 && apt-get install -y --no-install-recommends mypager=0.* vim-tiny=*\
 && mypager --installconf\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*
COPY psqlrc /root/.psqlrc
COPY k8e-docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["k8e-docker-entrypoint.sh"]

