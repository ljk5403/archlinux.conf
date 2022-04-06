alias ll='ls -la'
alias lh='ls -lah'
alias lsf='ls -lah --time-style=full'
alias dux='du -d1 -h'
alias cp='cp -r'

# Set proxy
alias myproxy='export http_proxy="127.0.0.1:8889";export https_proxy=$http_proxy; export all_proxy=socks5://127.0.0.1:1089'
alias unproxy='unset http_proxy https_proxy all_proxy'

# Wine: wechat
alias WCrun='/opt/apps/com.qq.weixin.deepin/files/run.sh'

# sudo vim with env
alias svim='sudo env HOME=$HOME vim'


WCDir='/home/jiankunli/ApplicationData/WeChat Files/wxid_7he74yyvh54422/FileStorage/'
alias wcfile='dolphin $WCDir/File/'
