# WeOwePro

## Start The Webserver
`foreman start` or `rails s`

## Populate Development Database

`rake db:reset`

`rake db:populate` 

## Heroku
To update: `git push heroku master` then `heroku run rake db:migrate`

To populate: `heroku pg:reset DATABASE` then `heroku run rake db:populate` 

Check # of Dyno's: `heroku ps`

Open app nn browser: `heroku open`

Server logs: `heroku logs` or for more information `heroku logs --tail`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
