Output output/jjui_details_diff.gif
#Output output/jjui_details_diff.webm

Require jjui
Require jj

Set Theme Dracula
Set Padding 0
Set FontSize 20
Set Width 1000
Set Height 600
Set Framerate 24
Set WindowBarSize 0

Hide
Type "./init.sh && jjui repo/" Enter
Wait /revisions/
Show

Sleep 1s
Type "l"
Sleep 1s
Type@1s "d"
Sleep 1s
Type@1s "jjjjdd"
Sleep 0.5s
Escape 2
Wait /revisions/
Sleep 1s
Type@0.7s "jjjjl"
Sleep 1s
Type "jd"
Sleep 1s
Escape 2
Wait /revisions/
Sleep 1s
Type "q"

