FROM node:latest

VOLUME /probeurre-data

RUN apt-get update && \
    apt-get install -y npm
	
COPY index.js /probeurre/index.js
COPY package.json /probeurre/package.json
COPY analyzer.sh /probeurre/analyzer.sh

WORKDIR /probeurre
RUN npm install

ENTRYPOINT ["/probeurre/analyzer.sh"]
