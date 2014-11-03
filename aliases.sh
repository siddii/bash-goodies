alias serve="python -m SimpleHTTPServer"

#o alias will only work on Mac OS
alias o="open"

# Find process with open port
popFn() {
    lsof -i tcp:$1
}
alias pop=popFn

#Source - http://apple.stackexchange.com/a/5461
pmanFn() {
    man -t "${1}" | open -f -a /Applications/Preview.app
}
alias pman=pmanFn

#Source - http://apple.stackexchange.com/a/5514
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"