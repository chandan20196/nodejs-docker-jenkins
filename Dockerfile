
FROM node:20-alpine

LABEL maintainer="chandan"

WORKDIR /app

COPY package*.json ./

RUN npm install

ADD . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

EXPOSE 3000

CMD ["node","server.js"]
