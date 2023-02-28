#!/bin/sh
PROMPT='$(prompt_context)%{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)%{$fg_bold[yellow]$(prompt_indicators)%}%{$reset_color%}'
# PROMPT+='$fg_bold[yellow]$(virtualenv_info)%{$reset_color%}'

BRANCH_ICON="\ue0a0"
ROOT_ICON="\u26A1"
GEAR_ICON="\u2699"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}"

function git_prompt_info() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_status)$BRANCH_ICON $(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX "
    fi
}

function parse_git_status() {
    local status_color="$ZSH_THEME_GIT_PROMPT_CLEAN"
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")
    if [[ -n ${staged} ]]; then
        status_color="$ZSH_THEME_GIT_PROMPT_STAGED"
    elif [[ -n ${unstaged} ]]; then
        status_color="$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    echo "$status_color"
}

function prompt_indicators() {
    if [[ "$UID" -eq 0 ]]; then
        echo "$ROOT_ICON "
    fi
    if [[ $(jobs -l | wc -l) -gt 0 ]]; then
        echo "$GEAR_ICON  "
    fi
    if [ $VIRTUAL_ENV ]; then
        echo '('`basename $VIRTUAL_ENV`') '
    fi
}

# display machine name if in ssh
function prompt_context() {
    if [[ -n "$SSH_CLIENT" ]]; then
        echo "%(?:%{$fg_bold[yellow]%}{%m}❯%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}{%m}❯❯ )"
    else
        echo "%(?:%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}❯❯ )"
    fi
}

# export SROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} %{$fg_bold[yellow]$(prompt_indicators)%}%{$reset_color%}'
# SROMPT+='$fg_bold[yellow]$(virtualenv_info)%{$reset_color%}'

export RPROMPT=$'%F{cyan}%*%f'
