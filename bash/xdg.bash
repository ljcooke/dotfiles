# -----------------------------------------------------------------------------
# Follow the XDG Base Directory spec where possible to avoid cluttering the
# home directory with dotfiles.
#
# See:
#   https://specifications.freedesktop.org/basedir-spec/latest/
#   https://wiki.archlinux.org/title/XDG_Base_Directory
#
# Bonus comment from a GitHub issue:
#   "I don't actually care about the XDG spec being followed on macOS. I care
#   about not having this directory in $HOME. XDG is just a means to an end."
#   https://github.com/swiftlang/swift-package-manager/issues/6204
# -----------------------------------------------------------------------------

if [ -z "${XDG_CONFIG_HOME:-}" ]; then
  export XDG_CONFIG_HOME="$HOME"/.config
fi
if [ -z "${XDG_CACHE_HOME:-}" ]; then
  export XDG_CACHE_HOME="$HOME"/.cache
fi
if [ -z "${XDG_DATA_HOME:-}" ]; then
  export XDG_DATA_HOME="$HOME"/.local/share
fi
if [ -z "${XDG_STATE_HOME:-}" ]; then
  export XDG_STATE_HOME="$HOME"/.local/state
fi

# ---
# Less pager
#
# Supports XDG paths since v598 (2021), but MacOS uses v581.2 (as of 2024).
# https://www.greenwoodsoftware.com/less/news.598.html
# ---
export LESSHISTFILE="$XDG_STATE_HOME"/lesshst
export LESSKEY="$XDG_CONFIG_HOME"/less

# ---
# Python
# ---
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history

# ---
# Python - matplotlib library
# https://matplotlib.org/1.4.2/faq/troubleshooting_faq.html
#
# Test to confirm it works:
#
#   python3 -m venv testenv
#   source testenv/bin/activate
#   python3 -m pip install matplotlib
#   python3
#     import matplotlib as mpl
#     mpl.get_configdir()
#   deactivate
# ---
export MPLCONFIGDIR="$XDG_CONFIG_HOME"/matplotlib

# ---
# Ruby - Bundler
# ---
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle/config
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# ---
# Ruby - rbenv
# ---
export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
