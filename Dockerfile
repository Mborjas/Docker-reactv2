FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#-------------------------- 2 bloque

FROM nginx
# /app/build ------ es la aparte que nos interesa
# origen   destino
COPY --from=builder /app/build /usr/share/nginx/html

