# Test web-app to use with Pluralsight courses and Docker Deep Dive book
# Linux x64
FROM alpine

LABEL maintainer="info@kian.co"

# Install Node and NPM
RUN apk add --update nodejs nodejs-npm

RUN npm run build --production

# Copy app to /src
COPY . /src

WORKDIR /src

# Install dependencies
RUN  npm install

EXPOSE 8080

ENTRYPOINT ["node", "./app.js"]

# You should always specify a full version here to ensure all of your developers
# are running the same version of Node.
#FROM node:7.8.0

# The base node image sets a very verbose log level.
#ENV NPM_CONFIG_LOGLEVEL warn

# Copy all local files into the image.
#COPY . .

# Build for production.
#RUN npm run build --production

# Install `serve` to run the application.
RUN npm install -g serve

# Set the command to start the node server.
CMD serve -s build

# Tell Docker about the port we'll run on.
EXPOSE 5000