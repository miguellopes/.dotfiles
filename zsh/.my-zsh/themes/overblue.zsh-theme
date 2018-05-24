autoload -U add-zsh-hook
function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}
function theme_precmd {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.

    PR_FILLBAR=""
    PR_PWDLEN=""


    local gitpromptsize=${#${git_prompt_info}}
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize + gitpromptsize" -gt "($TERMWIDTH / 2) + 5" ]]; then
      #((PR_PWDLEN=$TERMWIDTH - $promptsize))
      PROMPT='%(!.%{$fg[red]%}.%{$fg[white]%}%n@)%{$fg[red]%}%m%{$reset_color%}:%{$fg[yellow]%}%(!.%1~.%~) $(git_prompt_info)%{$reset_color%}
$(prompt_char)%{$reset_color%} '
    else
      #PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $rubypromptsize + $pwdsize)))..${PR_HBAR}.)}"
      PROMPT='%(!.%{$fg[red]%}.%{$fg[white]%}%n@)%{$fg[red]%}%m%{$reset_color%}:%{$fg[yellow]%}%(!.%1~.%~) $(git_prompt_info)%{$reset_color%}$(prompt_char)%{$reset_color%} '
    fi

}



add-zsh-hook precmd  theme_precmd

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
