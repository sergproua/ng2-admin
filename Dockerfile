FROM node:6.9.5
RUN npm install -g yarn

RUN git clone https://github.com/sergproua/ng2-admin.git /var/www \
    && cd /var/www \
    && yarn global add rimraf \
    && yarn run clean \
    && yarn global add webpack webpack-dev-server typescript@2.1.5 \
    && yarn install \
    && yarn run build:prod:aot

EXPOSE 8080

WORKDIR /var/www
ENTRYPOINT ["yarn", "run", "start:prod"]
