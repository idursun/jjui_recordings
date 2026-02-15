Output output/jjui_revset.gif
#Output output/jjui_revset.webm

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
Wait /normal/
Show
Sleep 0.5s

Type@0.2s "Lmin"
Sleep 1s
Tab
Sleep 1s
Type ' & anc'
Tab
Sleep 1s
Type "(visible"
Sleep 1s
Tab
Sleep 1s
Type ", 2)" Enter

Sleep 2s
Hide
Type "q"
