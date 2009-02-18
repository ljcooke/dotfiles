dotfiles
========

My precious config files, and a script to keep them updated on various machines.

Scripts
-------

* __update.rb__ -- Update dotfiles in $HOME, on another machine, etc.

        ./update.rb vim user@host:

Configuration files
-------------------

* __.bash__, __.bashrc__ -- Synchronised across OS X, Linux and Solaris machines.
  Machine-specific settings are saved to .bashrc.local, which is included by
  this file.

* __.irssi/inky.theme__ -- My Irssi theme; just a modification of the default theme.

* __.lineak/lineakd.conf__ -- Lineak settings, for mapping music keys in Linux.
  (Tested with a Dell Inspiron 9300.)

* __.mplayer/config__ -- My old mplayer settings. Used with Debian and Ubuntu.

* __.nanorc__ -- No longer used.

* __.pythonrc.py__ -- Python interactive startup file.

* __.screenrc__ -- Used with Debian; will probably work in other environments.

* __.vimrc__, __.vim/__ -- Works with vim (OS X, Linux, Solaris), MacVim and gVim.

* __.XCompose__ -- Putting the meta key to good use. Used with Debian and Ubuntu.
