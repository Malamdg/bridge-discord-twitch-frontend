### STEP 1 - build the Angular app (PROD) ###
FROM node:22-alpine AS build
# Virtual directory inside the docker image
WORKDIR /dist/src/app
# Copy package.json files to virtual directory
COPY package.json package-lock.json ./
# Run command in Virtual directory
RUN npm cache clean --force && npm install
# Copy files from local machine to virtual directory
COPY . .
RUN npm run build -- --configuration production


### STEP 2 - serve on NGINX ###
FROM nginx:latest AS ngi
# Copying compiled code and nginx config to different folder
# Copy the Angular build in the NGINX directory
COPY --from=build /dist/src/app/dist/frontend-angular/browser/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Exposing a port, here it means inside the container
# expose the http port
EXPOSE 80


### STEP 3 - dev stage (DEV IMAGE with Angular CLI live reload) ###
FROM node:22-alpine AS dev

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install -g @angular/cli && npm install

COPY . .

EXPOSE 4200
