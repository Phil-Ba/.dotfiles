#zplug
source /usr/share/zsh/scripts/zplug/init.zsh

zplug "kutsan/zsh-system-clipboard"

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi
# source plugins and add commands to the PATH
zplug load
#end zplug

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
setopt glob_complete

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/philba/.zshrc'

#Add custom completions
fpath=(~/.config/.zsh/completion $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall

#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==\e[35m=\e[32m}:${(s.:.)LS_COLORS}")';
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==35=32}:${(s.:.)LS_COLORS}")';
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
export PS1="┌─%1F%B[%3F%n%2F@%4F%m%5F %~%1F]%7F$%b
└──>"

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%B%3F [% NORMAL]% %b  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# vim stuff
bindkey -M viins 'jj' vi-cmd-mode
bindkey -a '^[[3~' delete-char
bindkey '^[[3~' backward-delete-char
bindkey "^?" backward-delete-char

#source scripts/colors.sh

#aliases
alias ls='ls --color=auto'
alias ..="cd .."
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

setopt HIST_IGNORE_ALL_DUPS
setopt globdots
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

__git_files () {
    _wanted files expl 'local files' _files
}

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export TERMCMD=urxvt

#ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

neofetch
