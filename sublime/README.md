# Sublime Text

## Install

On macOS:

  - brew cask install sublime-text

  - ln -s \
      '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' \
      /usr/local/bin/subl

## Configure

  - Install [Package Control](https://packagecontrol.io/installation).

  - Launch Sublime Text, and select Preferences > Package Control. Install the
    following packages:

      - [**Theme - Spacegray**](http://kkga.github.io/spacegray)
      - [Babel](https://github.com/babel/babel-sublime)
      - [Sass](https://github.com/nathos/sass-textmate-bundle)

  - Open the Preferences, which will open in two panes: Default and User.
    Replace the contents of the User preferences with the contents of
    [Preferences.sublime-settings](Preferences.sublime-settings).
