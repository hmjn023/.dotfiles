autoload -Uz compinit && compinit

eval "$(starship init zsh)"
source $HOME/.dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh
# variables
## history
HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
## PATH
export PATH=/var/lib/snapd/snap/bin:$PATH
export PATH=/home/hmjn/.local/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/flutter/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME=$ANDROID_HOME/ndk/26.3.11579264
export CHROME_EXECUTABLE=$(which google-chrome-stable)
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
# ranger
#export PAGER=dolphin
export VISUAL=nvim
export EDITOR=nvim
export BROWSER='/usr/bin/google-chrome-stable'

export MAKEFLAGS="-j $(nproc --all)"
export VCPKG_ROOT=/opt/vcpkg
export VCPKG_DOWNLOADS=/var/cache/vcpkg
# ailias
alias vi=nvim
alias cd=z
## ls
alias ls=lsd
alias la="ls -a"
alias ll="ls -ls"
alias lh="ls -lh"


# key settings
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey "${key[Shift-Tab]}"  reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

bindkey "^I" menu-expand-or-complete
#. $HOME/.dotfiles/zsh-romaji-complete/zsh-romaji-complete.plugin.zsh

eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

source /home/hmjn/.config/broot/launcher/bash/br
