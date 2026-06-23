#
# ~/.bashrc
#
eval "$(starship init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bt='bluetoothctl'
alias ff='fastfetch'
alias cm='cmus'

[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences
