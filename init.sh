#/bin/bash

rm -rf repo
mkdir repo
cp -r changes/init/ repo/
cd repo
jj git init
jj commit -m "initial commit"
jj bookmark set main -r @-
echo ".zig-cache/" >> .gitignore
echo "zig-out/" >> .gitignore
jj commit -m "add gitignore"

cp -r ../changes/change_1/README.md .
jj commit -m "add README"
cp -r ../changes/change_1/ARCHITECTURE.md .
jj commit -m "add ARCHITECTURE"
jj bookmark set docs -r @-

jj prev 2
cp -r ../changes/change_2/ .
jj commit -m "simplify main.zig"


cp -r ../changes/change_3/ .
rm src/root.zig

jj commit -m "remove library"

jj edit -r @-
