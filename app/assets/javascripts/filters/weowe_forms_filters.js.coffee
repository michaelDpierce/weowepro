@weoweproFilters.filter 'formatTime', ->
  (input) ->
    d = new Date(input)
    "#{d.toLocaleDateString()}"

