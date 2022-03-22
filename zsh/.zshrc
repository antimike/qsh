# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "spaceship" "avit")
ZSH_THEME_RANDOM_CANDIDATES+=( "sorin" )
ZSH_THEME_RANDOM_CANDIDATES+=( "fox" )
ZSH_THEME_RANDOM_CANDIDATES+=( "ys" )
ZSH_THEME_RANDOM_CANDIDATES+=( "lambda" )
ZSH_THEME_RANDOM_CANDIDATES+=( "smt" )
ZSH_THEME_RANDOM_CANDIDATES+=( "fletcherm" )
ZSH_THEME_RANDOM_CANDIDATES+=( "wezm" )
ZSH_THEME_RANDOM_CANDIDATES+=( "nanotech" )
ZSH_THEME_RANDOM_CANDIDATES+=( "mira" )
ZSH_THEME_RANDOM_CANDIDATES+=( "dst" )
ZSH_THEME_RANDOM_CANDIDATES+=( "muse" )
ZSH_THEME_RANDOM_CANDIDATES+=( "mlh" )
ZSH_THEME_RANDOM_CANDIDATES+=( "tonotdo" )
ZSH_THEME_RANDOM_CANDIDATES+=( "cloud" )
ZSH_THEME_RANDOM_CANDIDATES+=( "cypher" )
ZSH_THEME_RANDOM_CANDIDATES+=( "candy" )
# Themes tried and rejected: "bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse zsh-vi-mode)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf vi-mode git colorize command-not-found copybuffer copydir copyfile dnf extract github git-prompt pip safe-paste sudo taskwarrior themes web-search autojump zsh-syntax-highlighting colored-man-pages dotbare z git-annex cabal cargo)
plugins+=(zsh-vi-mode)
plugins+=(dircycle)
plugins+=(asdf)
# Plugins to consider:
# globalias (globbing triggered by <space>)
# thefuck (corrects previous command with Esc-Esc; conflicts with 'sudo' plugin)
# timer (displays command completion times)
# battery
# asdf
# catimg
# direnv
# dotenv (same as direnv, but without dependency on external direnv tool)
# fbterm

# Auto-generated completions
export GENCOMPL_FPATH=$ZSH/custom/functions/completion
source $ZSH/custom/plugins/zsh-completion-generator/zsh-completion-generator.plugin.zsh

# OMZ init script
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Necessary for ~/local-aliases.sh to work properly, as it relies on hisotry expanion
unsetopt HIST_VERIFY

# This allows bypassing history logging by prepending a space to a command
# see man zshoptions
setopt HIST_IGNORE_SPACE

# source $SOURCE_DIR/forgit/forgit.plugin.zsh
eval "$(mcfly init zsh)"
source <(cod init $$ zsh)
# _dotbare_completion_cmd

[[ -s "$MARKER_SOURCE" ]] && source "$MARKER_SOURCE"
# eval "$(fasd --init auto)"
# source "$SOURCE_DIR/fuzzy-fs/fuzzy-fs"
source /usr/share/autojump/autojump.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

# Make sure run-help works correctly
# TODO: Improve this with personalized run-help implementation
unalias run-help
autoload run-help

function zvm_after_init() {
  source $ZSH/plugins/fzf/fzf.plugin.zsh
  # TODO: Figure out what's wrong with the following line
  eval $(mcfly init zsh)
}
