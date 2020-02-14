#!/bin/bash
# 安装开发环境必备的软件
# 需要root权限或者sudo执行
# 跳转shell所在路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
# 获取当前操作系统发行版本
OS=$(/bin/bash ./scripts/os_distribution.sh)
echo "OS distribution: $OS"
if [[ $OS != "centos" && $OS != "ubuntu" ]]; then
	echo "Unknown OS distribution; Quit"
	exit
fi

# 安装基础开发工具
SOFT_LIST_CENTOS=( tmux gcc-c++ python3 python3-pip java-1.8.0-openjdk-headless git nodejs go )
SOFT_LIST_UBUNTU=( tmux gcc-c++ python3 python3-pip java-1.8.0-openjdk-headless git nodejs golang )
if [[ $OS == "centos" ]]; then
	sudo yum install -y ${SOFT_LIST_CENTOS[@]}
elif [[ $OS == "ubuntu" ]]; then
	sudo apt-get install -y ${SOFT_LIST_UBUNTU[@]}
else
	echo "install nothing"
fi
# 替换~/.bashrc
read -p "Replace ~/.bashrc with conf/bashrc? (y/n)" replace_conf
if [[ $replace_conf == "y" ]]; then
	cp ./conf/bashrc ~/.bashrc
fi
# 替换~/.bashrc
read -p "Replace ~/.gitconfig with conf/gitconfig? (y/n)" replace_conf
if [[ $replace_conf == "y" ]]; then
	cp ./conf/gitconfig ~/.gitconfig
fi
exit
