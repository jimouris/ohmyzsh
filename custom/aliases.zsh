alias lss='clear; ls -lh'
alias sz='source ~/.zshrc'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias ohmyzsh="code ~/.oh-my-zsh"
alias svi='sudo vim'
alias cat='bat'
alias top='htop'
alias htop='htop'
alias gc='git checkout'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias forcepull='git fetch origin && git reset --hard origin/main'

# anagrams
alias maek='make'
alias amke='make'
alias mkae='make'
alias reste='reset'
alias reest='reset'

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
