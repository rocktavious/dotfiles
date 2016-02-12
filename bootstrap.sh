#!/bin/bash
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick -b clone rocktavious/dotfiles
homeshick -b -f symlink dotfiles