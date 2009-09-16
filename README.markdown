dotfiles
========

My precious config files, and a script to keep them updated on various machines.


Scripts
-------

* __update.rb__ -- Update dotfiles in $HOME, on another machine, etc.

        ./update.rb user@host:  # defaults to 'common' fileset
        ./update.rb vim ~/
        ./update.rb --dry-run host:


Configuration files
-------------------

* __.bashrc__, __.bash_login__, __.bash/__ -- Bash settings, tested with OS X,
  Linux, Solaris and FreeBSD. Machine-specific settings are saved to
  __.bashrc.local__.

* __.inputrc__ -- Terminal input settings.

* __.irbrc__ -- Ruby startup file.

* __.irssi/inky.theme__ -- My Irssi theme; just a modification of the default theme.

* __.pythonrc.py__ -- Python interactive startup file.

* __.rsync-filter__ -- Some useful defaults for ignoring certain files when
  using rsync.

* __.screenrc__ -- Used with Debian; will probably work in other environments.

* __.vimrc__, __.vim/__ -- Used with vim & MacVim.


### No longer used

* __.lineak/lineakd.conf__ -- Lineak settings, for mapping music keys in
  Linux. Used with a Dell Inspiron 9300.

* __.mplayer/config__ -- mplayer settings. Used with Debian and Ubuntu.

* __.nanorc__

* __.XCompose__ -- Putting the meta key to good use. Used with Debian and
  Ubuntu.
