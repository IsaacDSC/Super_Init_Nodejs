echo "node_modules" >> ./dockerignore

echo "version: '3'

services:
    app:
      build: .
      command: npm run dev
      ports:
        - "3000:3000"
      volumes:
        - .:/usr/app" >> ./docker-compose.yml

echo "FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./
RUN npm i

COPY . .

EXPOSE 3000

CMD ['npm', 'run', 'dev']

" >> ./Dockerfile


echo "testedockerdode
docker build -t <ImageName> .

docker run -p 3000:3000 -d <ImageName>
<acesso navegador porta>:<acesso interno porta aplicação>

//saber images dockers rodando
docker ps



docker-compose up
docker-compose up -d" >> ./readmeDocker.md

mkdir ./src/@types

echo "//criando req.status using typescript
declare namespace Express {
   export interface Request {
      status?: string
   }
}" >> ./src/@types/express.ts

cp ./jest.config.ts ../../../jest.config.ts
cp ./tsconfig.json ../../../jtsconfig.json