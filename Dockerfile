ARG NODE_VERSION
FROM node:${NODE_VERSION}

USER node
WORKDIR /home/node/app

RUN mkdir node_modules
