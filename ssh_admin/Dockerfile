FROM node:lts-alpine AS builder
WORKDIR /app
COPY . ./
COPY .env.production ./

RUN yarn 
RUN yarn build 

FROM builder AS release
ENV PORT=3000 HOST=0.0.0.0
EXPOSE 3000
CMD ["yarn", "start", "-p", "3000"]