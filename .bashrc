# link up to the Mac OS 10.8 ssh-agent that is launched on startup
#  this is needed for ssh connections
function ssh_auth_socket_sync {
  export SSH_AUTH_SOCK=$(ls -1t /tmp/launch-*/Listeners|head -n 1)
}
ssh_auth_socket_sync

# look in /usr/local/lib - not sure why 10.8 doesn't do this by default
export LD_LIBRARY_PATH=/usr/local/lib:"$LD_LIBRARY_PATH}"



