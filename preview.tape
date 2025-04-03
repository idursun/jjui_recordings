Output output/jjui_preview.gif
#Output output/jjui_preview.webm

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
Wait /normal/
Show
Sleep 0.5s

Type "p"
Sleep 1s
Type@1.5s "jjj"
Sleep 1s
Type@0.1s "kkk"
Sleep 1s

Type "l"
Sleep 1s
Type "j"
Sleep 1s

Escape
Type "o"
Sleep 2s

Type "p"
Hide
Type "q"
