# FROM strapi/base:latest
FROM bitnami/node:latest

# RUN npm install --global --unsafe-perm strapi@3.6.1

RUN mkdir /srv/app && chown 1000:1000 -R /srv/app

WORKDIR /srv/app

VOLUME /srv/app

COPY . .
# ENTRYPOINT ["docker-entrypoint.sh"]
RUN npm config set unsafe-perm true

RUN npm ci

EXPOSE 8080
# RUN ls
# RUN sed -i "s/1337/8080/g" config/server.js

CMD ["npm", "run", "develop"]
