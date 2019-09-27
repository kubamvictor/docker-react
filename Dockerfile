# Multi-step docker file

# Section1: Build phas using npm/yarn
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN yarn build


# Section 2: Run phase using nginx
From nginx
COPY --from=builder /app/build /usr/share/nginx/html