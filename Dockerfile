FROM node:latest-alpine

LABEL maintainer="chandan"

WORKDIR /app

COPY package*.json ./

RUN npm install

ADD . .

EXPOSE 3000

RUN adduser -D nodeuser

USER nodeuser

CMD ["node","app.js"]
