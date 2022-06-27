# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.cfg_files/oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ked-ki"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages python vi-mode)

# User configuration

# golang
GOPATH="$HOME/.go/"

path_array=(
  # local bin folders
  "$HOME/bin" "$HOME/.local/bin"
  # yarn (package manager for nodejs)
  "$HOME/.yarn/bin" "$HOME/.config/yarn/global/node_modules/.bin"
  # cargo (package manager for rust)
  "$HOME/.cargo/bin"
  "$GOPATH/bin"
  # jenv: manager for multiple java versions
  "$HOME/.jenv/bin"
)
for dir in $path_array;
do
  [[ ":$PATH:" =~ ":$dir:" ]] || PATH="$dir:$PATH"
done
export PATH

# pyenv: manager for multiple concurrent python versions
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pyenv-virtualenv 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi

# nvm: manager for nodejs versions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# jenv: manager for multiple java versions
if command -v jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 

export JQ_COLORS="1;33:0;37:0;37:0;37:0;32:1;37:1;37"

# openssl compile flags
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

. $ZSH/oh-my-zsh.sh
