FROM node:lts-alpine AS builder

WORKDIR /app

COPY . ./
COPY .env.example ./.env/

RUN yarn

EXPOSE 5000

CMD yarn start