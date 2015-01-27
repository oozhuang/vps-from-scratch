#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`;pwd)
cd $CUR_DIR

if [ -d ./init/ ]; then
	for f in ./init/*.sh; do
		sudo bash $f
	done
	unset f
fi

