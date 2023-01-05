FROM ubuntu
RUN sudo su
RUN apt install nodejs
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
COPY ./ /app/
RUN ionic build --prod


