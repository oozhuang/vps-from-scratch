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

domain=`hostname`
if [[ "$domain" == "" ]]; then
	domain="localhost"
fi
cat $RESRC/gitconfig | sed "s/USERNAME/$1/g"| sed "s/DOMAIN/$domain/g" > /home/$1/.gitconfig

chown $1:$1 /home/$1/.gitconfig

