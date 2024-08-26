# This is where you put your hand rolled scripts (remember to chmod them)

export GPG_TTY=$(tty)

PATH="$HOME/bin:$PATH"
if [ "$(uname)" = "Darwin" ]; then
    export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
    export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"

    export JAVA_HOME="/opt/homebrew/opt/openjdk@11"
elif [ "$(uname -s | cut -c 1-5)" = "Linux" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$JAVA_HOME/bin:$PATH"
export PAGER="most"

source "$HOME/.cargo/env"

GOROOT=/usr/local/go
GOPATH=~/.go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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
