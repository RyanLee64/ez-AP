#!/bin/sh
#script for running just one test at a time before adding to official test suite
LLI="lli"
LLC="llc"
CC="cc"
MICROC="./ezap.exe"
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

    Run "$MICROC" "$1" ">" "${basename}.ll" &&
    Run "$LLC" "-relocation-model=pic" "${basename}.ll" ">" "${basename}.s" &&
    Run "$CC" "-o" "${basename}.exe" "${basename}.s" "./stdlib/ezaplib-main.a"
