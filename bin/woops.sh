git log -1 --pretty=%B
git log -1 --pretty=%B | tr -d '\n' | pbcopy
git reset --soft HEAD~1
