# first change directory to rest-api
cd github-heroku-test/
echo "Changed directory to github-heroku-test"
# add heroku git
echo "adding heroku repository"
git init
git add .
git rm -rf spec/ --cached
git commit -m "init"
git remote add heroku git@heroku.com:github-heroku-test.git
echo "Added heroku remote"
#pull heroku but then checkback out our current local master and mark everything as merged
git pull heroku master
git checkout --ours .
git add -u
git commit -m "merged with github master"
echo "merged with github"
#push back to heroku, open web browser, and remove git repository
git push heroku master
echo "Now you should check if heroku build is working fine"

# remove heroku .git folder
rm -fr .git

# Go back where we started
echo "Everything Done"
cd -
