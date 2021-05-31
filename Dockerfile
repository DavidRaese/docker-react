FROM node:alpine as builder
# for it to work on AWS don't use named builders
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html