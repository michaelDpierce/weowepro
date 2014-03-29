# WeOwePro

## Start The Webserver
`rails s`

## Populate Development Database
`rake db:reset`

`rake db:migrate`

`rake db:populate` 

## Git Commands

### Create Branch And Push To GitHub
Create and checkout new branch `git checkout -b new_branch_name`

Stage files `git add -A`

Commit files `git commit -m "your message here"`

Push new branch onto GitHub `git push -u origin new_branch_name`

***

### Assuming you're on the 'Master' branch
Stage files

Commit files

Push to master `git push origin master`

***

### Other Useful Commands

Rebuild Schema `rake db:schema:dump`

List branches `git branch`

Switch to new branch `git checkout (branch)`

Delete local branch `git branch -d (branch)`

## Heroku
To update: `git push heroku master`

To populate: `heroku pg:reset DATABASE` > `heroku run rake db:migrate` > `heroku run rake db:populate` 

***

### Other Useful Commands
Check # of Dyno's: `heroku ps`

Open app in browser: `heroku open`

Server logs: `heroku logs` or for more information `heroku logs --tail`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
