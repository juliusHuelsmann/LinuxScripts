
# fail if you fail 
set -e

# security commit
git commit -am "auto-commit: security pre-remove commit (README.md)"

# generate README.md
rm README.md
markdown-pp main.mdpp README.md
chmod -w README.md

# commit the changes
git commit -am "auto-commit: security pre-remove commit (README.md)"
# git push
