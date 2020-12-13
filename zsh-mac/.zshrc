alias vim=nvim
alias gp='git push'
alias gl='git pull'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
