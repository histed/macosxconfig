# link up to the Mac OS 10.8 ssh-agent that is launched on user GUI login
#  or launch a common ssh-agent (for use by ssh-only connections)
#  and load all keychain keys.  Echo no output.
function ssh_agent_sync {
  export SSH_AUTH_SOCK=$(ls -1t /tmp/launch-*/Listeners|head -n 1)
  ssh-add -L >/dev/null 2>&1
  if [ "$?" == 2 ]; then
      export SSH_AUTH_SOCK=`cat /tmp/lastsshagent-$USER`
      ssh-add -L >/dev/null 2>&1
      if [ "$?" == 2 ]; then 
          eval `ssh-agent -s` > /dev/null && echo "$SSH_AUTH_SOCK" > /tmp/lastsshagent-$USER 
      fi
  fi
  ssh-add -k >/dev/null 2>&1
}
ssh_agent_sync

# look in /usr/local/lib - not sure why 10.8 doesn't do this by default
#export LD_LIBRARY_PATH=/usr/local/lib:"$LD_LIBRARY_PATH}"
#  MH 130710: use symlinks instead!




