# Configuration for Zsh history management
HISTFILE=$HOME/.zsh_history                 # Path to the history file
HISTSIZE=10000                              # Maximum number of entries in history
SAVEHIST=10000                              # Maximum number of entries to save in the history file

# Function to start and fork a process, redirecting stdout and stderr to /dev/null
fork() {
  setsid --fork $@ > /dev/null 2>&1 &       # Start and fork process in background
}

# Enhanced ls aliases for improved listing experience

# ls: Enhanced ls alternative
alias ls='eza'

# ll: Human-readable list with detailed information
alias ll='eza -lh'

# la: Human-readable list with detailed information including hidden files
alias la='eza -lah'

# lt: Tree-style list with hierarchical representation
alias lT='eza -TL'

# lT: Tree-style list with hierarchical representation
alias lt='eza -T'

# l1: Single line list for compact display
alias l1='eza -1'

# lf: Shorter alias for running lfrun command
alias lf='lfrun'

# cat: Enhanced 'cat' command using 'bat' for syntax highlighting
alias cat='bat -p'

# loop: Loop videos infinitely in fullscreen mode using 'mpv'
alias loop='mpv --loop=inf --fullscreen'

# fastfetch: Fast alternative to 'neofetch' with customized logo and information
alias fastfetch='fastfetch --load-config examples/2 --logo-type builtin \
--logo arch --logo-padding 2 --logo-padding-top 1'

# update-mirrors: Update pacman mirrors by rating and selecting appropriate mirrors
alias update-mirrors='rate-mirrors --protocol https --entry-country india arch | tee mirrorlist; printf "Sure you want \
to overwrite the mirrorlist? [y/N]: "; read ok; [ "$ok" = "y" ] && sudo mv \
mirrorlist /etc/pacman.d/mirrorlist || rm mirrorlist'

# orphandel: Remove orphaned packages using Paru package manager
alias orphandel='paru -Rsnu $(paru -Qdtq)'

# mnt: Mount block device using 'udisksctl'
alias mnt='udisksctl mount -b'

# umnt: Unmount block device using 'udisksctl'
alias umnt='udisksctl unmount -b'

# ssh: Set TERM to xterm-256color and ssh
alias ssh='TERM=xterm-256color ssh'

# aria: Enhanced 'aria2c' command with default download path set to $HOME/Downloads
alias aria='aria2c -d $HOME/Downloads'

# clone : Clone a GitHub repository using github-cli and fzf
alias clone='gh repo clone $(gh repo ls | fzf | awk '\''{print $1}'\'')'

alias p='paru'  # Shorter alias for 'paru' package manager
alias n='nvim'  # Shorter alias for 'nvim' text editor
alias g='git'   # Shorter alias for 'git' version control

# non-interactive aliases

# vpn-connect: Connect to VPN using ProtonVPN with fastest server
alias vpn-connect='sudo protonvpn connect --fastest'

# vpn-disconnect: Disconnect from ProtonVPN
alias vpn-disconnect='sudo protonvpn disconnect'

# reboot-to-win: Reboot system into Windows using systemd-boot
alias reboot-to-win='systemctl reboot --boot-loader-entry=auto-windows'

# reload: Reinitialize river
alias reload='~/.config/river/init'

# d: Set brightness using ddcutil
alias d='ddcutil --brief --display 1 setvcp 10'

# saver: Put screen saver
alias saver='mpv --fullscreen --loop=inf $HOME/.loop'

# sleep: Suspend system using systemctl
alias sleep='systemctl suspend'
