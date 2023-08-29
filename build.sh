#!/bin/bash
cd $HOME/.config
git clone https://github.com/d-rens/dotfiles.git
mv $HOME/.config/dotfiles* $Home/.config/
rm -d $HOME/.config/dotfiles
# packer installation
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim





