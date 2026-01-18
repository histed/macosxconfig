## ssh_agent_sync removed as of 200822: on 10.14. This is from 10.8 at least
# # link up to the Mac OS 10.8 ssh-agent that is launched on user GUI login
# #  or launch a common ssh-agent (for use by ssh-only connections)
# #  and load all keychain keys.  Echo no output.
# function ssh_agent_sync {
#   export SSH_AUTH_SOCK=$(ls -1t /tmp/launch-*/Listeners|head -n 1)
#   ssh-add -L >/dev/null 2>&1
#   if [ "$?" == 2 ]; then
#       export SSH_AUTH_SOCK=`cat /tmp/lastsshagent-$USER`
#       ssh-add -L >/dev/null 2>&1
#       if [ "$?" == 2 ]; then 
#           eval `ssh-agent -s` > /dev/null && echo "$SSH_AUTH_SOCK" > /tmp/lastsshagent-$USER 
#       fi
#   fi
#   ssh-add -A -k >/dev/null 2>&1  # -A in 10.9 means the same as -k in 10.8; this command works for both
# }
# ssh_agent_sync

# look in /usr/local/lib - not sure why 10.8 doesn't do this by default
#export LD_LIBRARY_PATH=/usr/local/lib:"$LD_LIBRARY_PATH}"
#  MH 130710: use symlinks instead!

# Add local path things
PATH="${HOME}/shared/bin:/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

#. ~/anaconda38/etc/profile.d/conda.sh

alias ls='/usr/local/bin/gls --color'
alias moshl='mosh --server=/usr/local/bin/mosh-server'
alias ssha='ssh -A'
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias git-sync="$HOME/Repositories/git-sync/git-sync"
export EDITOR=emacs
export LESS="-R"


. "$HOME/.local/bin/env"
export PATH="/Users/histed/.pixi/bin:$PATH"
