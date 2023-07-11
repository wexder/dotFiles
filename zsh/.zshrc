export LANG=en_US.UTF-8

source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle docker
antigen bundle docker-compose
antigen bundle kubectl
antigen bundle ssh-agent
antigen bundle git@github.com:spwhitt/nix-zsh-completions.git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Tell Antigen that you're done.
antigen apply

ZSH_THEME="spaceship"

export EDITOR='nvim'

setopt GLOB_DOTS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.cargo" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi



#list
alias ls='ls --color=auto'
#fix obvious typo's
alias cd..='cd ..'
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
#readable output
alias df='df -h'

#continue download
alias wget="wget -c"

# tmux
alias ta="tmux attach -t"
alias ts="tmux new-sessions -s"

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# neofetch
eval "$(starship init zsh)"
