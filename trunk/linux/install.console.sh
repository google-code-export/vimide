#!/usr/bin/bash
# Auto configurated vim IDE
# Author:  Calidion
# Version: 0.1
# E-mail: calidion@gmail.com
# Project : https://code.google.com/p/vimide/

# Install commands: sh install.sh or chmod +x install.sh | ./install.sh

# Caution:
# must firstly run the following command:
# sudo apt-get install exuberant-ctags wget unzip

#function definitions

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

echo "\"VIMIDE vimrc basic settings
\"--------start---------
set fileencodings=ucs-bom,utf-8,cp936
set helplang=cn

set shiftwidth=2
set tabstop=2
set expandtab
set nobackup
set noswapfile
set nowb
set backspace=start,indent,eol
set nu!
set autoindent
set smartindent
set wrap

set noerrorbells
set novisualbell

filetype plugin on
filetype indent on

syntax on
set ruler

map <C-t> :NERDTree<cr>
map <C-o> :TlistToggle<cr>
vmap <C-c> \"+y
set mouse=a
autocmd VimEnter * NERDTree
autocmd BufEnter * silent! lcd %:p:h
\"--------end--------
" >> $vimrc

echo "\"VIMIDE gvimrc basic settings
set mouse=a
" >> $gvimrc

createDir $tmpdir

cd $tmpdir

#Basic structure for the IDE

#install NERDTree
# base: http://www.vim.org/scripts/script.php?script_id=1658
getScript "NERDTree.zip" 11834

#install Tag List
# base: http://www.vim.org/scripts/script.php?script_id=273
getScript "taglist.zip" 7701
echo "
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File = 1
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

#install showmarks
# base: http://www.vim.org/scripts/script.php?script_id=152
getScript "showmarks.zip" 2800

#install vimoutliner
# base: http://vim.sourceforge.net/scripts/script.php?script_id=517
getScript "vimoutliner.zip" 5768

#install project
# base: http://vim.sourceforge.net/scripts/script.php?script_id=69
getTarScript "project-1.4.1.tar.gz" 6273

#install snipMate
# base: http://vim.sourceforge.net/scripts/script.php?script_id=2540
getScript "snipMate.zip" 11006

#install vimspell
# base: http://vim.sourceforge.net/scripts/script.php?script_id=465
#getScriptFile "vimspell.vim" 4580

#install vim-autocomplpop
# base: http://vim.sourceforge.net/scripts/script.php?script_id=1879
getScript "vim-autocomplpop.zip" 11894

#install NERD_commenter
# base: http://vim.sourceforge.net/scripts/script.php?script_id=1218
getScript "NERD_commenter.zip" 10318

#install vcscommand
# base: http://vim.sourceforge.net/scripts/script.php?script_id=90
getScript "vcscommand.zip" 12440

#install txtbrowser
# base: http://www.vim.org/scripts/script.php?script_id=2899
getScript "txtbrowser.zip" 12776

#Lanuage supports and frameworks


#Javascript support

#install jsbeautify
# base: http://www.vim.org/scripts/script.php?script_id=2727
getScriptFile "jsbeautify.vim" 11120

#install JavascriptLint
# base: http://www.vim.org/scripts/script.php?script_id=2578
#getScriptFile "JavascriptLint.vim" 10540


#Ruby and rails support

#install rails
# base: http://www.vim.org/scripts/script.php?script_id=1567
getScript "rails.zip" 12622


#Python support

#install python doc 
# base: http://www.vim.org/scripts/script.php?script_id=910
getScriptFile "pydoc.vim" 12723 

#install python omni completion
# base: http://www.vim.org/scripts/script.php?script_id=1542
getFile "pythoncomplete.vim" 10872 /autoload


#C/C++ support

#install cvim
# base: http://vim.sourceforge.net/scripts/script.php?script_id=213
#getScript "cvim.zip" 12311

#install a.vim
# base: http://vim.sourceforge.net/scripts/script.php?script_id=31
getScriptFile "a.vim" 7218

#install omnicppcomplete
# base: http://vim.sourceforge.net/scripts/script.php?script_id=1520
getScript "omnicppcomplete.zip" 7722


#PHP support

#install php-doc
# base: http://vim.sourceforge.net/scripts/script.php?script_id=1355
getScriptFile "php-doc.vim" 4666
echo "
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
" >> $vimrc


#install perl-support
# base: http://vim.sourceforge.net/scripts/script.php?script_id=556
getScript "perl-support.zip" 12539


#install Java support
# base: http://www.vim.org/scripts/script.php?script_id=1213
getGzScript "vjde.tgz" 10992


#install xml support
# base: http://www.vim.org/scripts/script.php?script_id=301
getScriptFileType "xml.vim" 10362

#must be at the end of the file
#cd ..
#rm -rf $tmpdir

cd $mydir
cp -rf plugin/JavascriptLint.vim $dir/plugin
