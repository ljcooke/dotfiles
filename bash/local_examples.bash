export PATH="$HOME/bin:$PATH"

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# JS - nodenv
eval "$(nodenv init -)"

# JS - nvm
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

# Ruby - bundler
export BUNDLER_EDITOR=subl

# Ruby - rbenv
eval "$(rbenv init -)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
