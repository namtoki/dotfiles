if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# prompt
export PS1='[\[\e[36m\]\u\[\e[37m\]@\h \[\e[33m\]\W\[\e[32m\]$(__git_ps1 " (%s)")\[\e[0m\]]\$ '

# open tmux
tmux -2
