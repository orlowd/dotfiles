HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=10000

setopt appendhistory
setopt nobeep
setopt autocd
setopt extendedglob
setopt nomatch
setopt menucomplete
setopt interactive_comments

# Disable terminal freezing on Ctrl-s and unfreezing on Ctrl-q
stty stop undef
stty start undef

# Do not highlight pasted text
zle_highlight=('paste:none')

autoload -Uz compinit bashcompinit

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Automatically find new executables in path
zstyle ':completion:*' rehash true

# Menu-driven completion
zstyle ':completion:*' menu select

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Enable autocompletion of priveleged environments in priveleged commands
zstyle ':completion::complete:*' gain-privileges 1

zmodload zsh/complist

# Include hidden files in completions
_comp_options+=(globdots)

compinit
bashcompinit

# History partial completion search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz colors && colors

# Use vim mode
bindkey -v

# Reduce key sequence timeout (will be 10 ms)
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins	# initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'                   # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;}    # Use beam shape cursor for each new prompt.

# Keybindings
# Use Ctrl-p and Ctrl-n for previous/next partial look up in history
bindkey "^p" up-line-or-beginning-search	# Up
bindkey "^n" down-line-or-beginning-search	# Down

# Use Ctrl-k and Ctrl-j for previous/next partial look up in history
bindkey "^k" up-line-or-beginning-search	# Up
bindkey "^j" down-line-or-beginning-search	# Down

# Use the vi navigation keys Ctrl-(hjkl) besides cursor keys in menu completion
bindkey -M menuselect '^h' vi-backward-char        # Left
bindkey -M menuselect '^k' vi-up-line-or-history   # Up
bindkey -M menuselect '^l' vi-forward-char         # Right
bindkey -M menuselect '^j' vi-down-line-or-history # Bottom

# Enable navigation over completions in reverse
bindkey -M menuselect '^[[Z' reverse-menu-complete	# Shift-Tab

# Only press Enter once to input command when using autocompletion menu
bindkey -M menuselect '^M' .accept-line

# Environment variables
export EDITOR=/usr/bin/nvim

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS="--no-init --quit-if-one-screen -R"

# Aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
PS1="%F{blue}%n%f%F{white} %~ > %f"

# Activate plugins from antibody
source "$ZDOTDIR/plugins.sh"

# Plugins keybindings
bindkey '^ ' autosuggest-accept     # Ctrl-Space
bindkey '^X' autosuggest-execute    # Ctrl-X (sadly no sane way to map it to Ctrl-Enter)

# Activate fzf key bindings
source /usr/share/fzf/key-bindings.zsh
