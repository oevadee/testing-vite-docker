FROM node as build
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .