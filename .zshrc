####################
# .ZSHRC
# rachel's preferences
# 2019-10-10
####################

# # # # # # # # # #
# oh-my-zsh
# # # # # # # # # #

# Path to your oh-my-zsh installation.
export ZSH="/afs/csail.mit.edu/u/r/rmwu/.oh-my-zsh"
ZSH_THEME="agnoster"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

# # # # # # # # # #
#  General
# # # # # # # # # #

# Listing alias
alias lls='ls -FGltr'

# return to previous dir
alias back='cd $OLDPWD'

# an ssh-suitable hostname
alias scpme='echo $(whoami)@$(hostname):$(pwd)'

alias weather='curl http://wttr.in/Boston?m'

# # # # # # # # # #
#  Web Development
# # # # # # # # # #

# setup http server
alias localserv='python -m SimpleHTTPServer'

# sass watch with style
# usage: first arg file, second style
alias sasswatch='function _sasswatch(){ sass --watch $1.sass:$1.css --style $2; };_sasswatch'

# # # # # # # # # #
#  Remote Machines
# # # # # # # # # #

rosetta () {
    mosh rmwu@rosetta$1.csail.mit.edu --experimental-remote-ip=remote
}

athena='rmwu@athena.dialup.mit.edu'
alias sshmit='ssh $athena'

# # # # # # # # # #
#  CLANG
# # # # # # # # # #

alias gcc-4.2='gcc'

# # # # # # # # # #
# PYTHON
# # # # # # # # # #

# conda
# export PATH="/data/rsg/nlp/rmwu/miniconda3/bin:$PATH"  # commented out by conda initialize
alias py37='conda deactivate; conda activate py37'

alias mgh='conda deactivate; conda activate mgh'

# updated to cuda 10
export CUDA_HOME=/usr/local/cuda-10.1
export PATH=/usr/local/cuda-10.1/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

# gpustat with color
alias gpu="watch -n0.5 --color gpustat --color"

# use python 3
alias python='python3'

# profiling
alias pyprof='python -m cProfile -s time'

# # # # # # # # # #
# GIT
# # # # # # # # # #

alias gts='git status'
alias gtd='git diff'
alias gtl='git log'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data/rsg/nlp/rmwu/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data/rsg/nlp/rmwu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/data/rsg/nlp/rmwu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/data/rsg/nlp/rmwu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

