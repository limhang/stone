##open app
alias google="open /Applications/Google\ Chrome.app/"
alias x="open /Applications/Xcode8.app/"
alias v="vim"
alias md="open /Applications/MacDown.app/"

##open file recent
alias h5="sublime /Users/het/Desktop/cornerstone/app-h5-dev2/household/oppeinOven/"
alias ife="cd /Users/het/Desktop/jacob/ife_demo/demo/ife"

##git quick_code
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"


##redirection file recent-----------------------------
##stone
alias stone="cd /Users/het/Desktop/jacob/stone"
alias css="cd /Users/het/Desktop/jacob/stone/tech/frontend/web/css"
alias stnotes="cd /Users/het/Desktop/jacob/stone/stone"
alias daily="cd /Users/het/Desktop/jacob/stone/daily"
alias tk="cd /Users/het/Desktop/jacob/stone/think"

##train
alias train="cd /Users/het/Desktop/jacob/train"

##het
alias wk="cd /Users/het/Documents"
alias cs="cd /Users/het/Desktop/cornerstone"
##redirection file recent-----------------------------

##quick_key_system
alias .="cd .."
alias l="ls"
alias ..="cd ../.."
alias ...="cd ../../.."
alias c="clear"
alias sbash="vim ~/.bash_profile"
alias svbash="source ~/.bash_profile"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias p="pwd"


##find----------------------------------
##find some file(css.md) in stone文件夹,使用：stfind "css"(找出stone文件夹中有css命名的文件)
alias stfind="mdfind -onlyin /Users/het/Desktop/jacob/stone/stone/"
##查找指定文件名的文件,eg:find . -name "xxx"
alias fd="find . -name "
##查找文件中是否有xxx关键字，并指出是哪个文件哪行
##alias findkey="find . -name "*.md" | xargs grep "thermcontact"" 找到当前文件夹中所有后缀为.md的文件中，有thermcontact的行数
alias findkey="find . -name "*.md" | xargs grep"
##find----------------------------------

##rm------------------------------------
##删除stone文件中所有 .DS_Store
alias rmStDS="find /Users/het/Desktop/jacob/stone/stone -name .DS_Store |xargs rm -rf"
##rm------------------------------------


##vps_setting
alias vps="ssh root@138.128.198.147 -p 28943"
##passwd = 9981aa
