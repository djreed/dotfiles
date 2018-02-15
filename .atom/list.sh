apm list --installed --bare > package.list
git reset
git add package.list
git commit -S -m "Update Package List"
