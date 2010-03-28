#!/usr/bin/bash
# 作者: 北漂IT民工 vim 自动安装版 version 0.1
# 联系方式: calidion@gmail.com
# google Code 地址: https://code.google.com/p/vimide/

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

getScriptFile () {
  if [ ! -f "$1" ]; then
    echo "Start downloading $1, please wait..."
    wget http://www.vim.org/scripts/download_script.php?src_id=$2 -O $1
  fi
  cp -rf $1 $dir/plugin
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
