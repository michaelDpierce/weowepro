# WeOwePro

## Start The Webserver
`rails s`

## Populate Development Database

`rake db:reset`

`rake db:migrate`

`rake db:populate` 

## Git Commands

### Create branch and push to remote

Create and checkout new branch `git checkout -b new_branch_name`

Stage files `git add -A`

Commit files `git commit -m "Message here"`

Push new branch onto Gihub `git push -u origin new_branch_name`

***
### (If on master branch)

Be sure to stage and commit as well

Push to master `git push origin master`

***

### Userful commands

List branches `git branch`

Switch to new branch `git checkout (branch)`

Delete local branch `git branch -d (branch)`

## Heroku
To update: `git push heroku master`

To populate: `heroku pg:reset DATABASE` > `heroku run rake db:migrate` > `heroku run rake db:populate` 

***

Check # of Dyno's: `heroku ps`

Open app nn browser: `heroku open`

Server logs: `heroku logs` or for more information `heroku logs --tail`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
