# pull latest code
echo "start to pull"
git pull origin master
# input commit message
read -p "Input commit message: " msg
# show git status
git status
# add all changing
echo "start to add"
git add -A
# local commit
echo "start to commit"
git commit -m "$msg"
# push to remote repository
echo "start to push to origin"
git push origin master
# echo msg
echo "commit and push success!"
