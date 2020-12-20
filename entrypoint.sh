#!/bin/sh

set -e

mkdir -p /root/.ssh/
echo "$INPUT_DEPLOY_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

git config --global user.name "$INPUT_USER_NAME"
git config --global user.email "$INPUT_USER_EMAIL"

npm install hexo-cli -g 
npm install hexo-deployer-git --save

#todo: deploy

echo ::set-output name=notify::"Deploy comlete."
