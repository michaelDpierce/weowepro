# WeOwePro

[ ![Codeship Status for michaelDpierce/weowepro](https://codeship.io/projects/38cf9820-30ad-0132-a67f-12c40d681460/status)](https://codeship.io/projects/39886)

[![Code Climate](https://codeclimate.com/github/michaelDpierce/weowepro/badges/gpa.svg)](https://codeclimate.com/github/michaelDpierce/weowepro) [![Dependency Status](https://gemnasium.com/michaelDpierce/weowepro.svg)](https://gemnasium.com/michaelDpierce/weowepro) [![Stories in Ready](https://badge.waffle.io/michaeldpierce/weowepro.svg?label=ready&title=Ready)](http://waffle.io/michaeldpierce/weowepro)

[![Throughput Graph](https://graphs.waffle.io/michaeldpierce/weowepro/throughput.svg)](https://waffle.io/michaeldpierce/weowepro/metrics)

## Heroku

Server logs: `heroku logs` or for more information `heroku logs --tail`

***

Asset compile problems: In local dev enviortment run `RAILS_ENV=development bundle exec rake assets:precompile` then push to Heroku

## Run Rubocop

`rubocop` for detailed information see: https://github.com/bbatsov/rubocop
`rubocop --auto-correct` will automaticaly fix styling issues
