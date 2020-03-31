FROM node:12.14.1
WORKDIR /dealio
COPY ./ /dealio
RUN npm install
RUN npm install -g pm2
CMD ["pm2-runtime", "app.js"]