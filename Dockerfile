FROM debian:stable

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		libcap2 \
		curl \                                                                                                                      
		ca-certificates \
	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/* \
	&& rm /var/log/dpkg.log \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& rm -r /root/.gnupg/ \
	&& chmod +x /usr/local/bin/gosu

ENV LANG=C

COPY acmetool /usr/local/bin/
RUN chown root:root /usr/local/bin/acmetool && chmod 755 /usr/local/bin/acmetool
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
