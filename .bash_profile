

# normally added by Canopy installer; we have to manage this manually  (on all machines incl. rigs and desktops)
#   histed 130613
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
if [ -f ~/Library/Enthought/Canopy_64bit/User/bin/activate ]; then 
    VIRTUAL_ENV_DISABLE_PROMPT=1 
    source ~/Library/Enthought/Canopy_64bit/User/bin/activate
fi

# Old EPD path management - can be removed when all upgraded to canopy
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH

# Add local path things
PATH="${HOME}/shared/bin:/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

# crazy.  Default to utf-8  (try this as of 130701)
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

