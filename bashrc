#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"

export VISUAL=nvim
export EDITOR=nvim

alias playmidi='fluidsynth -a pulseaudio -i /usr/share/soundfonts/FluidR3_GM.sf2'
export PATH="$HOME/.npm-global/bin:$PATH"
