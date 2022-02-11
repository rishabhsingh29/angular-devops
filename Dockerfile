#stage 1
FROM node:14.19.0
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
CMD ls -ltr
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-devops /usr/share/nginx/html