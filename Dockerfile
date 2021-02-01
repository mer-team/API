FROM node:14-alpine

COPY ./src /merApi

WORKDIR /merApi

RUN npm install

ENTRYPOINT [ "npm", "start" ]

EXPOSE 8000