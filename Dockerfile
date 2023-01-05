FROM ubuntu
RUN sudo apt install nodejs
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
COPY ./ /app/
RUN ionic build --prod


