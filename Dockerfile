FROM node:6

MAINTAINER metaship app@xuezheyoushi.com

# set timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/shanghai" > /etc/timezone

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD npm run build -- -release

CMD cd ./build

# install dependencies
RUN npm i -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install --silent --production

CMD ["npm", "run", "start:prod"]
