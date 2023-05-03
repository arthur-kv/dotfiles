if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi

# if (command -v brew && brew list --formula | grep -c vim ) > /dev/null 2>&1; then
#     alias vim="$(brew --prefix vim)/bin/vim"
# fi
alias go="grc go"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPATH="$HOME/go"
export PATH=/opt/homebrew/bin/ag:$PATH
export PATH="GOPATH/bin:$PATH"
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:$HOME/go/bin
source ~/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# pnpm
export PNPM_HOME="/Users/arturk/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Show GIT branch in a terminal promt
# https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29
# https://www.makeuseof.com/customize-zsh-prompt-macos-terminal/
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{white}'
COLOR_GIT=$'%F{cyan}'
COLOR_DEF=$'%f'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%1~ ${COLOR_GIT}$(parse_git_branch) ${COLOR_DEF}%# '
