# git pull
# git submodule update
git fetch
git submodule foreach git fetch
git submodule foreach git checkout master
git submodule foreach git pull
# git add extra pkg exe
# git commit -m "updating packages"
