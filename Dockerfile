FROM debian:8

MAINTAINER Enproduktion GmbH <n@produktion.io>

COPY docker/apt/guh.list /etc/apt/sources.list.d/guh.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key A1A19ED6

RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    guh \
    guh-webinterface \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 3333 2222 4444

CMD /usr/bin/guhd -n
