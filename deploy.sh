#! /bin/bash

npm run build --production

scp -r ./build/* root@39.106.18.195:/home/wangyn/wenjiang/www/code-push-web
