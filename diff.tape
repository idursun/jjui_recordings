Output output/jjui_diff.gif
#Output output/jjui_diff.webm

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

Type "d"
Sleep 1s
Type@0.2s "jjjjjjkkk"
Escape
Type@1s "jd"
Sleep 1s
Escape
Type@1s "jd"
Sleep 1s
Escape
Wait /revisions/
Sleep 1s
Hide
Type "q"
