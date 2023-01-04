FROM node:16-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
COPY ./ /app/
RUN ionic build --prod


