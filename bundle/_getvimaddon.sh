#!/bin/sh
#######################################
###     get addon by git            ###
#######################################
git clone git://github.com/vim-scripts/pathogen.vim.git
git clone git://github.com/vim-scripts/cocoa.vim.git
git clone git://github.com/vim-scripts/taglist.vim.git
git clone git://github.com/vim-scripts/c.vim.git
git clone git://github.com/vim-scripts/The-NERD-tree.git
git clone git://github.com/vim-scripts/lookupfile.git
git clone git://github.com/vim-scripts/TagHighlight.git
git clone git://github.com/vim-scripts/calendar.vim.git
git clone git://github.com/vim-scripts/autoload_cscope.vim.git
git clone git://github.com/vim-scripts/SuperTab.git
git clone git://github.com/vim-scripts/minibufexpl.vim.git
git clone git://github.com/vim-scripts/genutils.git
git clone git://github.com/vim-scripts/javascript.vim.git
git clone git://github.com/vim-scripts/a.vim.git
git clone git://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git

#######################################
###     get addon by wget           ###
#######################################
mkdir -p cscope_maps/plugin
wget http://cscope.sourceforge.net/cscope_maps.vim -O cscope_maps/plugin/cscope_maps.vim
