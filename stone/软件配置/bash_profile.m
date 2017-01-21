##open app
alias google="open /Applications/Google\ Chrome.app/"
alias x="open /Applications/Xcode8.app/"
alias v="vim"
alias md="open /Applications/MacDown.app/"

##get into file
alias stnotes="cd /Users/het/Desktop/jacob/stone/stone/stone_notes"
alias .="cd .."
alias ..="cd ../.."
alias wk="cd /Users/het/Documents"


##find something in stone file
alias stfind="mdfind -onlyin /Users/het/Desktop/jacob/stone/stone/stone_notes"


##quick code
alias c="clear"
alias sbash="vim ~/.bash_profile"
alias svbash="source ~/.bash_profile"


##show tree
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


##查找指定文件名的文件,eg:find . -name "xxx"
alias fd="find . -name "


##删除文件夹中指定文件,eg:.DS_Store就是需要删除的文件，stone_notes为指定目录
alias rmnoteDS="find /Users/het/Desktop/jacob/stone/stone/stone_notes -name .DS_Store |xargs rm -rf"