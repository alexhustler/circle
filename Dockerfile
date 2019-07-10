FROM node:11 AS base

RUN mkdir -p /code
WORKDIR /code

COPY package.json yarn.lock ./

RUN apt-get update -y && apt-get install -y build-essential

FROM base AS development-dependencies
RUN yarn install --production=false

FROM development-dependencies AS build
COPY . .
RUN yarn build
