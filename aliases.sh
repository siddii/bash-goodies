alias serve="python -m SimpleHTTPServer"
#o alias will only work on Mac OS
alias o="open"
# Find process with open port
popFn() {
    lsof -i tcp:$1
}
alias pop=popFn