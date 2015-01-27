#!/usr/bin/env bash

if [[ $# -lt 2 ]]; then
	echo "usage: $0 username password">&2; 
	exit -1
fi

if [[ ! -d /home/$1 ]]; then
	echo "user-dir does not exist.">&2;
	exit -1
fi

echo "$1:$2" | chpasswd

