# WeOwePro

## Start the webserver
`foreman start`

## Populate development database

`rake db:reset`

`rake db:populate` 

## Heroku
To update: `git push heroku master` then `heroku run rake db:migrate`

To populate: `heroku run rake db:populate` (Only do this if the database is not populated)

Check # of Dyno's: `heroku ps`

Open app: `heroku open`

Server logs: `heroku logs` or for more information `heroku logs --tail`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
