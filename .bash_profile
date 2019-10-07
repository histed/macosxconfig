# crazy: Default to utf-8  (try this as of 130701)
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100

# Iterm2 titlebar
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];$(basename $(dirname $PWD))/$(basename ${PWD})\007"; ':"$PROMPT_COMMAND";
fi

# execute other/local bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi



