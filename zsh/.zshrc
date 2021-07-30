# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/luisbarrera/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/luisbarrera/.oh-my-zsh"

# Set colorscheme using pywal
(cat ~/.cache/wal/sequences &)
(wal -q --theme base16-seti &)

# pfetch
(pfetch &&)


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# DISABLE_AUTO_TITLE="true"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	alias-finder
	colored-man-pages
	fancy-ctrl-z
	fzf
	ripgrep
	zsh-interactive-cd
	)

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

#####################################
############## Aliases ##############
#####################################
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Configurar zsh
alias zshconfig="nvim ~/.zshrc"
# Configrar ohmyzsh
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Configurar AwesomeWM
alias wmrc="nvim ~/.config/awesome/rc.lua"
# Configuar tema de AwesomeWM
alias themewm="nvim ~/.config/awesome/space-theme.lua"
# Configuar xmonad
alias xmwm="nvim ~/.xmonad/xmonad.hs"

# Corre Script para usar un monitor
alias onescreen="sh ~/scripts/onescreenlayout.sh"
# Corre Script para usar dos monitores
alias rightscreen="sh ~/scripts/rightscreen.sh"
alias leftscreen="sh ~/scripts/leftscreen.sh"
alias upscreen="sh ~/scripts/upscreen.sh"

# Abre jupyter notebook
alias jn="jupyter-notebook"
alias jl="jupyter-lab"

# Alias para usar MariaDB
# alias startmysql="systemctl enable mysqld.service --now"
# alias restartmysql="systemctl restart mysqld.service"
# alias stopmysql="systemctl disable mysqld.service --now"

# Abrir configuración de nvim
alias nvimconfig="cd ~/.config/nvim && nvim ~/.config/nvim/init.vim"
# Administrar plugins de nvim
alias nvimplugins="cd ~/.config/nvim && nvim ~/.config/nvim/vim-plug/plugins.vim"
# Configuración básica de vim y nvim
alias vimrc="vim ~/.vimrc"

# Abre otra terminal
alias kitty="kitty --detach"

# Abre zathura de manera correcta
alias zathura="zathura --fork"

# Perfil de privacidad para firefox
alias firefoxprofile="firefox -no-remote -P privacy-profile"

# Alias para bare repo de mis dotfiles
# alias dots="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# Función para grabar pantalla, toma el nombre del video de salida como parámetro (es necesario pulseaudio)
grabar() {
  if [ "$1" != "" ]
  then
    sh /home/luisbarrera/scripts/grabar.sh $1
  fi
}

# Ejecutar jamovi
# alias jamovi="flatpak run org.jamovi.jamovi"

# Ejecutar news flash
# alias rss="flatpak run com.gitlab.newsflash"

# Pull de varias carpetas locales a remoto de google drive
alias gpull="sh $HOME/scripts/gpull.sh"
alias gpush="sh $HOME/scripts/gpush.sh"

# Ver imágenes en el directorio actual
alias images="viewnior ./"

# Abre el stream de lofi en mpv
# Utiliza youtube-dl para obtener una calidad no tan alta, por defecto se usa la mejor calidad posible
# Para obtener el codigo del formato, usar youtube-dl --list-formats <URL>
alias lofi="mpv --ytdl-format=94 https://youtu.be/5qap5aO4i9A"
# Reproduce sonidos de ruido blanco desde youtube
alias whitenoise="mpv --ytdl-format=251 https://youtu.be/nMfPqeZjc2c"
# Reproduce sonidos relajantes de la selva
alias relax="mpv --ytdl-format=251 https://youtu.be/cjkFG6bHGNc"

# Siguiendo el meme
alias l='ls'
alias s='ls'
alias sl='ls'
alias lls='ls'
alias lsl='ls'
alias lss='ls'
alias sll='ls'
alias sls='ls'

# Kittens, plugins para kitty
# alias ssh='kitty +kitten ssh'

# Abrir archivos de la escuela en zathura
alias horario="zathura ~/Trim-8/Horario21P.pdf"
alias caluam="zathura ~/Trim-7/Calendario_UAM.pdf"
# alias librogrupos="zathura ~/Trim-7/Grupos/Judson-Abstract_algebra.pdf"
# alias librogruposesp="zathura ~/Trim-7/Grupos/Algebra_abstracta-Judson.pdf"
alias flutterbook="zathura ~/Pendientes/Flutter\ for\ Beginners\ by\ Alessandro\ Biessek\ \(z-lib.org\).pdf"
alias tsbook="zathura ~/Pendientes/Programming\ TypeScript\ by\ Boris\ Cherny\ \(z-lib.org\).epub"

# Abrir AppImages
alias pizarron="~/AppImages/OpenBoard-4fca3a6-x86_64.AppImage"

# Abrir nvim en VimWiki
alias vimwiki="cd ~/Notas && nvim -c VimwikiIndex"
alias wiki="cd ~/Notas && nvim -c VimwikiIndex"

# Alias a oneliners
alias toimg="convert label:@- process.png" # después de un comando, hacer pip a este alias covierte la salida a una imágen
alias ipdir="curl ipinfo.io" # Muestra la ip
alias contribuidores="git log --format='%aN' | sort -u" # Muestra ordenandamente los contribuidores de un repo git
alias common-comands="history | awk '{print $2}' | sort | uniq -c | sort -rn | head" # Comandos más comunes
alias lsd="ls -d */" # Lista solo los directorios
alias bigger-dirs="du -hs */ | sort -hr | head" # Lista los directorios más grandes
alias internet-inspect="ss -p" # Muestra las apps que están usando internet
# alias rm-excepto="rm -f !(test.txt)" # Borra todos los archivos, excepto el que le demos
alias basic-server="python3 -m http.server" # Crea un server básico para poder compartir archivos sobre la red

# Sustituir ls con exa
alias la="exa -la --icons --group-directories-first"
alias ls="exa -l --icons --group-directories-first"

# Translate
alias trans-es="trans -s es -t en"
alias trans-en="trans -s en -t es"

# Anaconda environment
alias conda-activate="source /opt/anaconda/bin/activate root"
alias conda-deactivate="source /opt/anaconda/bin/deactivate root"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh