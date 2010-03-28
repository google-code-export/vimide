#!/usr/bin/bash
# 作者: 北漂IT民工 vim 自动安装版 version 0.1
# 联系方式: calidion@gmail.com
# google Code 地址: https://code.google.com/p/vimide/

# 安装方法: sh install.sh 或 chmod +x install.sh | ./install.sh
# Install commands: sh install.sh or chmod +x install.sh | ./install.sh

#global variables
mydir=`pwd`
tmpdir=/tmp/vimide
 
#vim directory preparation
dir=~/.vim
if [ ! -d "$dir" ]; then
  mkdir $dir
  echo "dir: $dir created"
fi

#vimrc configuration
vimrc=~/.vimrc
if [ ! -f "$vimrc" ]; then
  touch $vimrc
  echo "file: $vimrc created"
fi

echo "
set fileencodings=ucs-bom,utf-8,cp936
set shiftwidth=2
set tabstop=2
set expandtab
set nu!
set mouse=a
set nobackup
set noswapfile
set nowb
set backspace=start,indent,eol
set noerrorbells
set novisualbell
set helplang=cn
map <C-t> :NERDTree<cr>
map <C-s> :w<cr>
vmap <C-c> \"+y
" >> $vimrc
if [ ! -d "$tmpdir" ]; then
  mkdir $tmpdir
fi
cd $tmpdir

#install vim help doc for chinese
vimcdoc=vimcdoc-1.5.0.tar.gz
vimcdocdir=vimcdoc-1.5.0
if [ -d "$vimcdocdir" ]; then
  rm -rf $vimcdocdir
fi
if [ ! -f "$vimcdoc" ]; then
  wget http://nchc.dl.sourceforge.net/sourceforge/vimcdoc/$vimcdoc
fi
tar -xvf $vimcdoc
cd $vimcdocdir
sh vimcdoc.sh -i
cd ..
rm -rf $vimcdocdir

#function definitions

getScript () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  unzip -o $1 -d $dir
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


#install NERDTree
# base: http://www.vim.org/scripts/script.php?script_id=1658
getScript "NERDTree.zip" 11834


#install Tag List
# base: http://www.vim.org/scripts/script.php?script_id=273
getScript "taglist.zip" 7701
echo "
let Tlist_Ctags_Cmd='/usr/bin/ctags'
" >> $vimrc

#install miniBuffer
# base: http://www.vim.org/scripts/script.php?script_id=159 
getScriptFile "minibufexpl.vim" 3640
echo "
  let g:miniBufExplMapWindowNavVim = 1 
  let g:miniBufExplMapWindowNavArrows = 1 
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1
" >> $vimrc

#install TaskList
# base: http://www.vim.org/scripts/script.php?script_id=2607
getScriptFile "tasklist.vim" 10388

#install rails
# base: http://www.vim.org/scripts/script.php?script_id=1567
getScript "rails.zip" 12622

#install python omni completion
# base: http://www.vim.org/scripts/script.php?script_id=1542
getFile "pythoncomplete.vim" 10872 /autoload

#install showmarks
# base: http://www.vim.org/scripts/script.php?script_id=152
getScript "showmarks.zip" 2800

cd ..
rm -rf $tmpdir
cd $mydir
