#!/usr/bin/bash
# Vim 自动安装 IDE
# 作者: 北漂IT民工
# 版本: 0.1
# 联系方式: calidion@gmail.com
# 项目: https://code.google.com/p/vimide/

# 安装方法: sh install.zh-CN.sh 或 chmod +x install.zh-CN.sh | .\install.zh-CN.sh

# 注意:
# 必须要先执行下面的命令:
# sudo apt-get install exuberant-ctags wget unzip

#函数定义

getScript () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  unzip -o $1 -d $dir
  echo "$1 install finished."
}

getTarScript () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  tar -xvf $1 -C $dir
  echo "$1 install finished."
}

getGzScript () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  tar -xzf $1 -C $dir
  echo "$1 install finished."
}

getScriptFileType () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  cp -rf $1 $dir/ftplugin
  echo "$1 install finished."
}

getScriptFile () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  cp -rf $1 $dir/plugin
  echo "$1 install finished."
}

getFile () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  cp -rf $1 $dir$3
  echo "$1 install finished."
}

createDir () {
  if [ ! -d "$1" ]; then
    mkdir $1
    echo "dir: $1 created"
  fi
}

removeDir () {
  if [ -d "$1" ]; then
    rm -rf $1
  fi
}

createFile () {
  if [ ! -f "$1" ]; then
    touch $1
    echo "file: $1 created"
  fi
}

#global variables
mydir=`pwd`
tmpdir=/tmp/vimide
 
#vim directory preparation
dir=~/.vim

createDir $dir

#vimrc configuration
vimrc=~/.vimrc
gvimrc=~/.gvimrc


createFile $vimrc
createFile $gvimrc
createDir $tmpdir
cd $tmpdir

#install vim help doc for chinese
vimcdoc=vimcdoc-1.5.0.tar.gz
vimcdocdir=vimcdoc-1.5.0
removeDir $vimcdocdir
if [ ! -f "$vimcdoc" ]; then
  wget http://nchc.dl.sourceforge.net/sourceforge/vimcdoc/$vimcdoc
fi
tar -xvf $vimcdoc
cd $vimcdocdir
sh vimcdoc.sh -i
cd ..
removeDir $vimcdocdir
cd $mydir
