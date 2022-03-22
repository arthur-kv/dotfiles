if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi

if (command -v brew && brew list --formula | grep -c vim ) > /dev/null 2>&1; then
    alias vim="$(brew --prefix vim)/bin/vim"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)" # On Intel macs Homebrew is installed here: /usr/local/Homebrew/

export PATH=/opt/homebrew/bin/ag:$PATH
