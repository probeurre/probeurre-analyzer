FROM node:latest

VOLUME /probeurre-data

RUN apt-get update && \
    apt-get install -y npm
	
COPY index.js /probeurre/index.js
COPY analyzer.sh /probeurre/analyzer.sh

WORKDIR /probeurre

ENTRYPOINT ["/probeurre/analyzer.sh"]
