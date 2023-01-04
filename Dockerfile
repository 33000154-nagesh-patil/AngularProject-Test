FROM node:16-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g @angular/cli
RUN npm install -g ionic
RUN npm install
COPY ./ /app/
RUN ionic build --prod
RUN cd /myApp/www
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /myApp/www/ /usr/share/nginx/html/
