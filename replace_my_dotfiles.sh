#!/bin/bash

#Replace dotfiles
rm $HOME/.profile
ln .profile $HOME/.profile

rm $HOME/.bashrc
ln .bashrc $HOME/.bashrc

rm $HOME/.vimrc
mkdir $HOME/.vimtmp
mkdir $HOME/.vimtmp/.backup
mkdir $HOME/.vimtmp/.swp
mkdir $HOME/.vimtmp/.undo
ln .vimrc $HOME/.vimrc

rm $HOME/.config/i3/config 
ln i3config $HOME/.config/i3/config 
