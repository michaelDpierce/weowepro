@weoweproFilters.filter 'formatTime', ->
  (input) ->
    d = new Date(input)
    "#{d.toLocaleDateString()}"

.filter 'formatCurrency', ->
  (input) ->
    if input then "$#{input}" else ''

