FROM node:14-alpine3.16
WORKDIR /app
RUN npm install
COPY . .
EXPOSE 3030
CMD ["npm", "start"]
