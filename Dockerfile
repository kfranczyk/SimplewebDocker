# syntax=docker/dockerfile:1.3
FROM node:alpine

WORKDIR /usr/app/

RUN apk add --no-cache openssh-client git

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh git clone git@github.com:kfranczyk/SimplewebDocker.git .

RUN npm install 

CMD ["npm", "start"]