FROM node:14-alpine

ARG DB_USERNAME=root
ARG DB_PASSWORD=teste
ARG DB_DATABASE=mer
ARG DB_HOST=localhost

COPY ./src /merApi

WORKDIR /merApi

RUN npm install

ENTRYPOINT [ "npm", "start" ]

EXPOSE 8000