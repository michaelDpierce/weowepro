@weoweproFilters.filter 'booleanToWords', ->
  (input) ->
    if input then 'Yes' else 'No'

.filter 'adminConversion', ->
    (input) ->
      if input == 'Manager' then 'Yes' else 'No'
