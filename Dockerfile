FROM node:6

MAINTAINER metaship app@xuezheyoushi.com

# set timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/shanghai" > /etc/timezone

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install dependencies
COPY package.json ./package.json
RUN npm i -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install

# bundle app source
COPY . .

# build release
RUN npm run build -- --release

WORKDIR ./build

# bundle app source
COPY . .

CMD ["npm", "run", "start:prod"]
