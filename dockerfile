FROM node:18.12.0-alpine3.16

RUN mkdir -p /home/node/app/node_modules && chown -R root:root /home/node/app
WORKDIR /home/node/app
COPY package*.json ./

USER root
RUN npm install
COPY --chown=root:root . .

# Install Doppler CLI

EXPOSE 5123

CMD [ "node", "app.js" ]