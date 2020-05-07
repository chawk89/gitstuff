mkdir foobar
cd foobar
touch .gitignore
git init
echo "# foobar" > README.md
git add .
git commit -m "Initial commit"
git remote add origin git@code.stanford.edu:naras/foobar.git
git push origin master
