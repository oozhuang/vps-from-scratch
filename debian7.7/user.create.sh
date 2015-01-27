#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`;pwd)
cd $CUR_DIR
set -e

sudo useradd $1 -m -s /bin/bash
sudo bash ./user/passwd.sh $1 $2
sudo bash ./user/vim.sh $1
sudo bash ./user/gitconfig.sh $1

