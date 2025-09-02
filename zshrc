autoload -Uz compinit && compinit

# variables
## history
HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
## PATH
export PATH=/var/lib/snapd/snap/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/flutter/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME=$ANDROID_HOME/ndk/26.3.11579264
export CHROME_EXECUTABLE=$(which google-chrome-stable)
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$HOME/.bun/bin:$PATH
# ranger
#export PAGER=dolphin
export VISUAL=nvim
export EDITOR=nvim
export BROWSER='/usr/bin/google-chrome-stable'

export MAKEFLAGS="-j $(nproc --all)"
export VCPKG_ROOT=/opt/vcpkg
export VCPKG_DOWNLOADS=/var/cache/vcpkg
# aliases
alias vi=nvim
alias cd=z
## ls
alias ls=lsd
alias la="ls -a"
alias ll="ls -ls"
alias lh="ls -lh"


# key settings
source $HOME/.dotfiles/zsh/keys.zsh
#. $HOME/.dotfiles/zsh-romaji-complete/zsh-romaji-complete.plugin.zsh
source $HOME/.dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh


source $HOME/.config/broot/launcher/bash/br
# mise configuration
source $HOME/.dotfiles/zsh/mise.zsh

eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
