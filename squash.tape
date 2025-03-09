Output output/jjui_squash.gif
Output output/jjui_squash.webm

Require jjui
Require jj

Set Theme Dracula
Set Padding 0
Set FontSize 20
Set Width 1000
Set Height 600
Set Framerate 24
Set WindowBarSize 0
Env "EDITOR" "vim"

Hide
Type "jjui repo/" Enter
Wait /normal/
Show
Sleep 0.5s

Type@0.5s "j"
Sleep 0.5s
Type "S"
Type@0.8s "jk" Enter
Sleep 2s
Type "dG"
Sleep 1s
Type@1s "i"
Type "combine documentation"
Sleep 100ms
Ctrl+C
Sleep 1s
Type "ZZ"
Wait /normal/
Sleep 2s
Hide
Type "q"
