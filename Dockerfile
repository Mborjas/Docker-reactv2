FROM node:alpine

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#-------------------------- 2 bloque

FROM nginx
# /app/build ------ es la aparte que nos interesa
# origen   destino
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

