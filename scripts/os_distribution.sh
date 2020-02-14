#!/bin/bash
# 判断当前操作系统版本，是centos还是ubuntu
OS=?"unknown"
ISCENTOS=`cat /proc/version | grep centos | wc -l`
ISUBUNTU=`cat /proc/version | grep ubuntu | wc -l`
if [[ $ISCENTOS = 1 && $ISUBUNTU = 0 ]]; then
	OS="centos"
elif [[ $ISCENTOS = 0 && $ISUBUNTU = 1 ]]; then
	OS="ubuntu"
else
	OS="unknown"
fi
echo $OS
