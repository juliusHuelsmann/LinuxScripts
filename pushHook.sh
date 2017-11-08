
# fail if you fail 
set -e

# security commit
echo -e        "auto-commit: security pre-remove commit (README.md)"
git commit -am "auto-commit: security pre-remove commit (README.md)"

# generate README.md
rm README.md
markdown-pp main.mdpp README.md
chmod -w README.md

# commit the changes
echo -e        "auto-commit: auto generate README.md"
git commit -am "auto-commit: auto generate README.md"
# git push
