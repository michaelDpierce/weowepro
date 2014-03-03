# WeOwePro

## Populate Database

`rake db:populate` will reset and populate the database

## Push to Heroku
`git push heroku master` then `heroku run rake db:migrate`

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop

## Line Count
`find . -name '*.rb' | xargs wc -l`
