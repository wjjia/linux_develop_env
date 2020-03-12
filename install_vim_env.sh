#!/bin/bash
# 安装vim插件和辅助工具，将vim变成一个好用的开发环境
# 跳转shell所在路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
mkdir -p temp
# 获取当前操作系统发行版本
OS=$(/bin/bash ./scripts/os_distribution.sh)
echo "OS distribution: $OS"
if [[ $OS != "centos" && $OS != "ubuntu" ]]; then
	echo "Unknown OS distribution; Quit"
	exit
fi

# 将Vim升级到8.0
# 下载第三方yum源
#sudo wget -P /etc/yum.repos.d/  https://copr.fedorainfracloud.org/coprs/lbiaggi/vim80-ligatures/repo/epel-7/lbiaggi-vim80-ligatures-epel-7.repo
# update vim
#sudo yum update -y vim*

# 安装Exuberant-Ctags支持tagbar插件
sudo yum install -y ctags-etags
# 安装格式化等辅助工具
sudo pip3 install --upgrade autopep8
#sudo pip3 install jsbeautifier
sudo npm -g install js-beautify
cd ./tools/
# wget https://nchc.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz
cd ../temp/
cp ./tools/astyle_3.1_linux.tar.gz .
tar xvzf astyle_3.1_linux.tar.gz
cd ./astyle/build/gcc/
make
sudo make install

# 安装vim插件
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 替换~/.vimrc
cd $SHELL_FOLDER
read -p "Replace ~/.vimrc with conf/vimrc? (y/n)" replace_conf
if [[ $replace_conf == "y" ]]; then
	cp ./conf/vimrc ~/.vimrc
	cp -r ./conf/vim/* ~/.vim/
fi
echo "To install vim plugins please open vim and run: :PluginInstall"
exit
