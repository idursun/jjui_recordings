Output output/add_to_revset.gif
Require jj

Set Shell "bash"
Set Theme Dracula
Set Padding 0
Set FontSize 16
Set Width 1200
Set Height 640
Set Framerate 24
Set WindowBarSize 0

Hide
Type 'export JJ_CONFIG="$PWD/jj-config.toml" JJUI_CONFIG_DIR="$HOME/demo/jjui-config" && ./init.sh && clear && jjui ~/demo/repo' Enter
Wait /revisions/
Show
Sleep 0.3s
Type "jj"
Sleep 0.5s
Type "ia"
Sleep 0.8s
Type "*"
Sleep 1.5s
Type "j"
Sleep 0.5s
Type "ib"
Sleep 0.8s
Type "*"
Sleep 2s
Hide
Type "q"
