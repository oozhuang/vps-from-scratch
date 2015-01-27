#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
	echo "usage: $0 username ">&2; 
	exit -1
fi

if [[ ! -d /home/$1 ]]; then
	echo "user-dir does not exist.">&2;
	exit -1
fi

CUR_DIR=$(cd `dirname $0`; pwd)
RESRC=$CUR_DIR/../resource
set -e

apt-get install vim --force-yes

cp -R $RESRC/vim-suite/* /home/$1/

chown -R $1:$1 /home/$1/.vim*

