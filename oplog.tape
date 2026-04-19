Output output/jjui_oplog.gif
#Output output/jjui_oplog.webm

Require jjui
Require jj

Set Theme Dracula
Set Padding 0
Set FontSize 13
Set Width 1000
Set Height 600
Set Framerate 12
Set WindowBarSize 0

Hide
Type "./init.sh && jjui repo/" Enter
Wait /revisions/
Show
Sleep 0.5s

Type@1.5s "op"
Enter
Sleep 2s
Type@1s "jjj"
Enter
Sleep 2s
Type@1s "r"
Sleep 1s
Hide
Type "q"
