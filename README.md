# WeOwePro

## Start The Webserver
`foreman start` or `rails s`

## Populate Development Database

`rake db:reset`

`rake db:migrate`

`rake db:populate` 

## Heroku
To update: `git push heroku master`

To populate: `heroku pg:reset DATABASE` > `heroku run rake db:migrate` > `heroku run rake db:populate` 

Check # of Dyno's: `heroku ps`

Open app nn browser: `heroku open`

Server logs: `heroku logs` or for more information `heroku logs --tail`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
