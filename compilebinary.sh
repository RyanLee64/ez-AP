#!/bin/sh
#script for compiling just a singular .ez source file down to a binary
LLI="lli"
LLC="llc"
CC="cc"
EZAP="./ezap.exe"
SignalError() {
    if [ $error -eq 0 ] ; then
        echo "FAILED"
        error=1
    fi
    echo "  $1"
}


Run() {
    echo $* 1>&2
    eval $* || {
	SignalError "$1 failed on $*"
	return 1
    }
}
    basename=`echo $1 | sed 's/.*\\///
                             s/.ez//'`

    Run "$EZAP" "$1" ">" "${basename}.ll" &&
    Run "$LLC" "-relocation-model=pic" "${basename}.ll" ">" "${basename}.s" &&
    Run "$CC" "-o" "${basename}.exe" "${basename}.s" "./stdlib/ezaplib-main.a"
