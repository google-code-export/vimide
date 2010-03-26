#!/usr/bin/bash

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
map <C-t> :NERDTree<cr>
map <C-s> :w<cr>
vmap <C-c> \"+y
" >> $vimrc

getScript () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  unzip -o $1 -d $dir
  echo "$1 install finished."
}

#install NERDTree
# base: http://www.vim.org/scripts/script.php?script_id=1658
getScript "NERDTree.zip" 11834


#install Tag List
# base: http://www.vim.org/scripts/script.php?script_id=273
getScript "taglist.zip" 7701
