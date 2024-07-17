#!/bin/bash

# Copy .vimrc in place
cp .vimrc ~/.vimrc

# Don't run code from the internet kids
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


