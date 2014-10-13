@weoweproFilters.filter 'sumByKey', ->
  (data, key) ->
    return 0  if typeof (data) is "undefined" or typeof (key) is "undefined"
    sum = 0
    i = data.length - 1

    while i >= 0
      sum += parseInt(data[i][key])
      i--
    sum
