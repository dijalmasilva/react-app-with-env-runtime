FROM node:alpine

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build

EXPOSE 5000

RUN cp -r build /home/build

WORKDIR /home/build

COPY env.sh .
COPY .env .

RUN apk add --no-cache bash

RUN chmod +x env.sh

RUN yarn global add serve

CMD ["/bin/bash", "-c", "./env.sh && serve -s"]