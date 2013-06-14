# normally added by Canopy installer; we have to manage this manually 
#   histed 130613
# For non-rig machines - does this make sense?
if [ -f ~/Library/Enthought/Canopy_64bit/User/bin/activate ]; then 
    source ~/Library/Enthought/Canopy_64bit/User/bin/activate
fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

