# This is where you put your hand rolled scripts (remember to chmod them)
PATH="$HOME/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export PATH="$PATH/$JAVA_HOME/bin"

source "$HOME/.cargo/env"

GOROOT=/usr/local/go
GOPATH=~/.go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

