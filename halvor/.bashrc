#------------------------------------#
#               CUSTOM               #
#------------------------------------#

# Open multiple repos in individual tabs
function vimlife() {
  if [[ $# -lt 1 ]]; then
    echo "USAGE: vimlife REPO .."
    return
  fi  

  cmd="vim -p"
  
  for repo in "$@"; do
  cmd+=" $repo"
  done
  
  cmd+=' -c "tabdo tcd %:p:h"'
  
  eval $cmd
}

# Dynamically set Tmux window name to SSH target
function tssh() {
  if [ -n "$TMUX" ]; then  # Check if we're in a tmux session
      tmux rename-window "$(echo $1 | cut -d'@' -f2)" 2> /dev/null
  fi  
  ssh $@
  if [ -n "$TMUX" ]; then
      tmux set-window-option automatic-rename on > /dev/null 2>&1
  fi  
}

# Different prompt when launching bash from Vim
if [ $VIM ]; then
  PS1='VIM:\w\$ '
fi

#set -o v
