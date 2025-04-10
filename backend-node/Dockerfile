# Node LTS
FROM node:22-alpine

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
