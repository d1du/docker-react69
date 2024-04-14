FROM node:16-alpine as builder69
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder69 /app/build /usr/share/nginx/html

