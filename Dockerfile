FROM node:alpine

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build

EXPOSE 5000

RUN cp -r build /home/build

WORKDIR /home/build

COPY env.js .
COPY .env .

RUN apk add --no-cache bash
RUN yarn global add serve

CMD ["/bin/bash", "-c", "node env.js && serve -s"]