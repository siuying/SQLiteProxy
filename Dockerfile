FROM node:latest

RUN mkdir /src/
COPY main.js /src/
COPY package.json package-lock.json /src/

ENV CFLAGS "-DSQLITE_ENABLE_FTS3_TOKENIZER"
RUN cd /src/; npm install better-sqlite3 better-sqlite3-mozporter --build-from-source; npm install

EXPOSE 2048

ENTRYPOINT ["node", "/src/main.js", "--port", "2048"]
