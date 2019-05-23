FROM node:12.2.0-alpine

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build

EXPOSE 3001

COPY ./env.sh .
COPY .env .

RUN apk add --no-cache bash

RUN chmod +x env.sh

RUN yarn global add serve

WORKDIR /app/build

CMD["/bin/bash", "./env.sh && serve -s"]