#!/bin/bash
# Builds the demo repository for the v0.11 recordings.
# Run from anywhere; the repository, its remotes and workspaces go to ~/demo.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHANGES="$HERE/../changes"
DEMO="$HOME/demo"
export JJ_CONFIG="$HERE/jj-config.toml"
export JJUI_CONFIG_DIR="$DEMO/jjui-config"

mkdir -p "$DEMO"
cd "$DEMO"
rm -rf repo remotes workspaces
mkdir -p remotes workspaces jjui-config
git init -q --bare remotes/origin.git
git init -q --bare remotes/upstream.git

# commit the working copy as someone else
commit_as() { jj commit --quiet -m "$2"; jj metaedit --quiet --author "$1" -r @-; }
ADA="Ada Lovelace <ada@example.com>"
GRACE="Grace Hopper <grace@example.com>"

mkdir repo
cp -r "$CHANGES/init/." repo/
cd repo
jj git init --quiet
[ "$(jj root)" = "$DEMO/repo" ] || { echo "not in demo repo" >&2; exit 1; }
jj git remote add origin "$DEMO/remotes/origin.git"
jj git remote add upstream "$DEMO/remotes/upstream.git"

# trunk: a few commits by other people, pushed to origin and upstream
commit_as "$ADA" "initial commit"
printf '.zig-cache/\nzig-out/\n' > .gitignore
commit_as "$ADA" "add gitignore"
jj tag set v0.1.0 -r @- 2>/dev/null || git --git-dir=.jj/repo/store/git tag v0.1.0 "$(jj log -r @- --no-graph -T commit_id)"
FORK=$(jj log -r @- --no-graph -T 'change_id.short()')

sed -i '' 's/0.0.0/0.1.1/' build.zig.zon
commit_as "$ADA" "bump version to 0.1.1"
echo "// TODO: logging" >> src/main.zig
commit_as "$GRACE" "note logging todo"
printf 'MIT License\n' > LICENSE
commit_as "$ADA" "add license"
jj bookmark set --quiet main -r @-
jj bookmark track --quiet main --remote origin
jj bookmark track --quiet main --remote upstream
jj git push --quiet --remote origin -b main
jj git push --quiet --remote upstream -b main

# a teammate's branch that only exists on origin (untracked remote bookmark)
jj new --quiet "$FORK"
mkdir -p .github/workflows
printf 'name: ci\non: push\n' > .github/workflows/ci.yml
commit_as "$GRACE" "ci: build on push"
jj bookmark set --quiet ci -r @-
jj bookmark track --quiet ci --remote origin
jj git push --quiet --remote origin -b ci
jj bookmark forget --quiet ci
jj bookmark untrack --quiet ci --remote origin 2>/dev/null || true

# docs: pushed, then one more local commit so it is ahead of origin
jj new --quiet "$FORK"
cp "$CHANGES/change_1/README.md" .
jj commit --quiet -m "add README"
jj bookmark set --quiet docs -r @-
jj bookmark track --quiet docs --remote origin
jj git push --quiet --remote origin -b docs
cp "$CHANGES/change_1/ARCHITECTURE.md" .
commit_as "$GRACE" "add ARCHITECTURE"
jj bookmark set --quiet docs -r @-

# cleanup: local only, two commits
jj new --quiet "$FORK"
cp -r "$CHANGES/change_2/." .
commit_as "$GRACE" "simplify main.zig"
cp -r "$CHANGES/change_3/." .
rm -f src/root.zig
jj commit --quiet -m "remove library"
jj bookmark set --quiet cleanup -r @-

# a conflict: same line changed on trunk and here, rebased onto trunk
jj new --quiet "$FORK"
sed -i '' 's/0.0.0/0.2.0/' build.zig.zon
jj commit --quiet -m "bump version to 0.2.0"
jj bookmark set --quiet release -r @-
jj rebase --quiet -b release -d main

# a divergent change: described differently from two operations
jj new --quiet "$FORK"
echo "// experiment" >> src/main.zig
jj commit --quiet -m "experiment"
jj new --quiet "$FORK"
EXP=$(jj log -r 'description(exact:"experiment\n")' --no-graph -T 'change_id.short()')
OP=$(jj op log -n 1 --no-graph -T 'id.short()')
jj describe --quiet -r "$EXP" -m "experiment: parser cache"
jj --at-op "$OP" --ignore-working-copy describe --quiet -r "$EXP" -m "experiment: faster parser" 2>/dev/null

# a second workspace on the docs branch
jj workspace add --quiet --name review -r docs "$DEMO/workspaces/review"

# working copy on top of cleanup
jj new --quiet cleanup
