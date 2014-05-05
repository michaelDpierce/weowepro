# WeOwePro

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

### Other Useful Commands

Rebuild Schema `rake db:schema:dump`

List branches `git branch`

Switch to new branch `git checkout (branch)`

Delete local branch `git branch -d (branch)`

## Heroku
To update: `git push heroku master`

To populate: `heroku pg:reset DATABASE --weowepro` > `heroku run rake db:migrate` > `heroku run rake db:populate` 

To resrart: `heroku restart`

Check # of Dyno's: `heroku ps`

Server logs: `heroku logs` or for more information `heroku logs --tail`

***

Asset compile problems: In local dev enviortment run `RAILS_ENV=development bundle exec rake assets:precompile` then push to Heroku

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop
`rubocop --auto-correct` will automaticaly fix styling issues
