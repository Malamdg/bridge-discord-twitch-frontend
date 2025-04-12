### STEP 1 - production build ###
FROM node:22-alpine AS prod
# workdir on container
WORKDIR /app
# copy depedencies files first (cache optimisation)
COPY package*.json ./
# install dependencies (production only)
RUN npm ci --omit-dev
# copy the rest of the code
COPY . .
# expose the app's port by the Node app
EXPOSE 3000
# define the start command
CMD ["npm", "start"]


### STEP 2 - development image ###
FROM node:22-alpine AS dev
# workdir on container
WORKDIR /app
# copy depedencies files first (cache optimisation)
COPY package*.json ./
# install dependencies (dev)
RUN npm install
# copy the rest of the code
COPY . .
# expose the app's port by the Node app
EXPOSE 3000
# define the start command
CMD ["npm", "run", "dev"]
