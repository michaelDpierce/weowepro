@weoweproFilters.filter 'booleanToWords', ->
  (input) ->
    if input then 'Yes' else 'No'
