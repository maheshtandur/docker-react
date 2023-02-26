# Buod two docker image (1. Build Phaer and 2. Run Phase

# FIrst layer of commands
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second layer
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
