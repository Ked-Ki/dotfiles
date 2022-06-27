alias rezsh='. ~/.zshrc'
alias cdgit='cd $(git rev-parse --show-toplevel)'

findjava_impl() {
  find "${1}" -name "*${2}*.java" -and -not -name "*.class" -and -not -name "*.orig"
}
alias findjava=findjava_impl
alias fj='findjava .'

jqless_impl() {
  if [ -z ${1+x} ]; 
  then jq . - ; 
  else jq . "${1}" ; 
  fi |
    less
}
alias jqless=jqless_impl

jqvim_impl() {
  if [ -z ${1+x} ]; 
  then jq . - ; 
  else jq . "${1}" ; 
  fi |
    vim -c 'set filetype=json' -R -
}
alias jqvim=jqvim_impl
alias jsonhead='sed '\''/^}$/q'\'

alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias less='less -S'
alias zless='zless -S'
alias sl=ls

alias git-remove-untracked='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d'

# pomodoro is from https://github.com/carlmjohnson/pomodoro
alias pom='noti pomodoro'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# work tracking, requires a json file in home and a utility jq module, work-log, in jq path
summarize_work_impl() {
  jq -s 'import "work-log" as wl; wl::summarize_week' ~/work-log.json
}
alias summarize_work=summarize_work_impl
incr_pr_impl() {
  jq -s 'import "work-log" as wl; wl::incr_pr' ~/work-log.json | sponge ~/work-log.json
}
alias incr_pr='incr_pr_impl; summarize_work_impl'
incr_meeting_impl() {
  jq -s 'import "work-log" as wl; wl::incr_meeting' ~/work-log.json | sponge ~/work-log.json
}
alias incr_meeting='incr_meeting_impl; summarize_work_impl'

alias clear_clipboard='printf "" | pbcopy'
alias cclp=clear_clipboard
alias w3clp=copy_w3_pass.sh
alias vpn=connect_cos_vpn.sh
