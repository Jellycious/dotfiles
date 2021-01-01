# Jelle Meijer: jellejanwil@gmail.com
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#Run programs on startup
#Network manager applet
# TODO: DON't open twice
nm-applet &
# Flux
# TODO: DON't open twice
fluxgui &


export PATH="$HOME/.cargo/bin:$PATH"

#Remap middle mouse button to side button
xmodmap -e 'pointer = 1 9 3 4 5 6 7 8 2' &> /dev/null


export QSYS_ROOTDIR="/home/jelle/.altera/19.1.0/quartus/sopc_builder/bin"
if [ -e /home/jelle/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jelle/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
