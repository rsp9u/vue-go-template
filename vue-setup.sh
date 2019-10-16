#!/bin/sh
echo -n "app name: "; read APP_NAME

mkdir -p web
docker run --rm -ti -v $PWD/web:/src -w /src node:12-alpine sh -c "
  yarn global add @vue/cli &&
  vue create ${APP_NAME} $* &&
  mv ${APP_NAME}/* ${APP_NAME}/.[!.]* ./ &&
  rmdir ${APP_NAME} &&
  chown -R $(id -u):$(id -g) /src
"
