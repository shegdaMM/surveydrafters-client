FROM node:16.13.0

WORKDIR /surveydrafters-client

COPY ./ /surveydrafters-client

RUN npm install

CMD ["npm", "run", "serve"]