# This is where you put your hand rolled scripts (remember to chmod them)
PATH="$HOME/bin:$PATH"

if [ "$(uname)" == "Darwin" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
fi
export PATH="$PATH/$JAVA_HOME/bin"
export PAGER="most"

source "$HOME/.cargo/env"

GOROOT=/usr/local/go
GOPATH=~/.go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=/opt/homebrew/opt/python@3.11/libexec/bin:$PATH

GPG_TTY=$(tty)
export GPG_TTY

export FOUNDRY_PATH="$HOME/.foundry/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
export J2_RENDER_VERSION=v0.1.0

export NILLION_HOME="/Users/jimouris/repos/nillion/"

function run-nada-tests() {
  cd $NILLION_HOME && cargo test -p execution-engine-vm -p jit-compiler -p bytecode-evaluator -p nada-compiler-backend && cd -
}

PATH=$PATH:$HOME/.nilup/bin

eval "$(fzf --zsh)"

