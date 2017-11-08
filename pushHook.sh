
# fail if you fail 

# security commit
echo -e        "auto-commit: security pre-remove commit (README.md)"
git commit -am "auto-commit: security pre-remove commit (README.md)"

# generate README.md
rm -f README.md
markdown-pp main.mdpp -o README.md
chmod -w README.md

# commit the changes
echo -e        "auto-commit: auto generate README.md"
git commit -am "auto-commit: auto generate README.md"
# git push
