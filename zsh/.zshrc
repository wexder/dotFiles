export LANG=en_US.UTF-8

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git
    tmux
    docker
    docker-compose
    kubectl
    ssh-agent

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES

# Tell Antigen that you're done.
antigen apply

ZSH_THEME="spaceship"

export EDITOR='nvim'


####   ARCOLINUX SETTINGS   ####
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
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


#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# neofetch
eval "$(starship init zsh)"
