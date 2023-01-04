FROM node:16-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
COPY ./ /app/
RUN ionic build --prod
RUN cd /AngularProject-Test/www
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /AngularProject-Test/www/ /usr/share/nginx/html/
