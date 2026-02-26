#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

# Init starship prompt
eval "$(starship init bash)"

export ANDROID_HOME=$HOME/Android/Sdk/

export HF_XET_HIGH_PERFORMANCE=1
export HF_XET_NUM_CONCURRENT_RANGE_GETS=32

# PYENV for managing multiple python versions
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-cli/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-cli/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-cli/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-cli/google-cloud-sdk/completion.bash.inc'; fi

source '/home/sol/.bash_completions/hf.sh'

