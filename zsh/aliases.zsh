# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# git aliases
#
alias gce="git config --global user.name epulla && git config --global user.email erickpulladsi@gmail.com"
alias gchm="git config --global user.name epulla-hm && git config --global user.email epulla@happymoney.com"

# neovim alias
alias vim="nvim"

# Docker CLI Aliases
alias dc="docker-compose"
alias dl="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 730502903637.dkr.ecr.us-east-1.amazonaws.com"
alias dp="docker system prune -f --volumes"

# Airflow2 Aliases
alias dx2="docker exec -it airflow2"
alias dx2-test="docker exec -e AIRFLOW_ENV=test -it airflow2"

# utilities
## count files in a directory
alias file-count="ls -1q | wc -l"

# tmux
alias tmux="tmux -2"

