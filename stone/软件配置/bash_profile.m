##open app
alias google="open /Applications/Google\ Chrome.app/"
alias x="open /Applications/Xcode8.app/"
alias v="vim"
alias md="open /Applications/MacDown.app/"

##open file recent
alias h5="sublime /Users/het/Desktop/cornerstone/app-h5-dev2/household/oppeinOven/"

##redirection file recent
alias css="cd /Users/het/Desktop/jacob/stone/stone/stone_notes/tech/frontend/web/css"
alias stnotes="cd /Users/het/Desktop/jacob/stone/stone/stone_notes"
alias daily="cd /Users/het/Desktop/jacob/stone/stone/stone_notes/daily"
alias tk="cd /Users/het/Desktop/jacob/stone/stone/stone_notes/think"
alias wk="cd /Users/het/Documents"
alias cs="cd /Users/het/Desktop/cornerstone"

##quick_key_system
alias .="cd .."
alias l="ls"
alias ..="cd ../.."
alias ...="cd ../../.."
alias c="clear"
alias sbash="vim ~/.bash_profile"
alias svbash="source ~/.bash_profile"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

##find----------------------------------
##find some file(css.md) in stone文件夹,使用：stfind "css"(找出stone文件夹中有css命名的文件)
alias stfind="mdfind -onlyin /Users/het/Desktop/jacob/stone/stone/stone_notes"
##查找指定文件名的文件,eg:find . -name "xxx"
alias fd="find . -name "
##查找文件中是否有xxx关键字，并指出是哪个文件哪行
##alias findkey="find . -name "*.md" | xargs grep "thermcontact"" 找到当前文件夹中所有后缀为.md的文件中，有thermcontact的行数
alias findkey="find . -name "*.md" | xargs grep"


##rm------------------------------------
##删除文件夹中指定文件,eg:.DS_Store就是需要删除的文件，stone_notes为指定目录
alias rmnoteDS="find /Users/het/Desktop/jacob/stone/stone/stone_notes -name .DS_Store |xargs rm -rf"
##删除stone文件中所有 .DS_Store
alias rmStDS="find /Users/het/Desktop/jacob/stone/stone -name .DS_Store |xargs rm -rf"
