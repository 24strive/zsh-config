source ~/.bash_profile
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# load our own completion functions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)

# Path
export PATH="/Users/heping/bin:/usr/local/sbin:/usr/local/bin:$PATH";
# Setting ZSH_THEME
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

# PROMPT='%{$fg[$NCOLOR]%}%c 🚴  %{$reset_color%}'
# PROMPT='%{$fg[$NCOLOR]%}%c $(~/.rbenv/bin/rbenv-prompt) 🐚 %{$reset_color%}'
if [ -n "$INSIDE_EMACS" ]; then
   PROMPT='%{$fg[$NCOLOR]%}%c $%{$reset_color%} '
else
   PROMPT='%{$fg[$NCOLOR]%}%c 🐚 %{$reset_color%} '
fi
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

# Load git functions
#source "/Users/lenage/.zsh/lib/gpg-agent.zsh"
source "/Users/heping/.zsh/lib/git.zsh"
source "/Users/heping/.zsh/lib/completion.zsh"
source "/Users/heping/.zsh/lib/correction.zsh"
# aliases
if [ -e "$HOME/.zsh/lib/aliases.zsh" ]; then
  source "$HOME/.zsh/lib/aliases.zsh"
fi
# Load custom files
source "/Users/heping/.zsh/custom/project.zsh"

# automatically enter directories without cd
setopt auto_cd

# use Emacs as an editor
#export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient
export EDITOR="vim"

#use emacs keybinding
bindkey -e

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
# bindkey "^A" beginning-of-line
# bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
#export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# Enable extended globbing
setopt EXTENDED_GLOB

# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt APPEND_HISTORY

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER=less
export LC_CTYPE=en_US.UTF-8
ulimit -s unlimited

## plugins
plugins=(colored-man)

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

export CDPATH=~/Project
## FOR python virtualenvwrapper
#http://docs.python-guide.org/en/latest/dev/virtualenvs/
