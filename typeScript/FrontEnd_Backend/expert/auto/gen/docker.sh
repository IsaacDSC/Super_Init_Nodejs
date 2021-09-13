echo "FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./
RUN npm i

COPY . .

EXPOSE 3000

CMD ['npm', 'run', 'dev']
" >> ../../Dockerfile


echo "version: '3'

services:
    app:
      build: .
      command: npm run dev
      ports:
        - '3000:3000'
      volumes:
        - .:/usr/app" >> ../../docker-compose.yml