# crazy: Default to utf-8  (try this as of 130701)
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100

# Iterm2 titlebar
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];"$(basename "$(dirname "$PWD")")"/"$(basename "$PWD")"\007";'
fi

# execute other/local bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/histed/miniconda38/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/histed/miniconda38/etc/profile.d/conda.sh" ]; then
        . "/Users/histed/miniconda38/etc/profile.d/conda.sh"
    else
        export PATH="/Users/histed/miniconda38/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

