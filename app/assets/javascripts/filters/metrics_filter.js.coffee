@weoweproFilters.filter 'sumByKey', ->
  (data, key) ->
    return 0  if typeof (data) is "undefined" or typeof (key) is "undefined"
    sum = 0
    i = data.length - 1

    while i >= 0
      sum += parseInt(data[i][key])
      i--
    sum

@weoweproFilters.filter "customCurrency", [
  "$filter"
  ($filter) ->
    return (amount, currencySymbol) ->
      currency = $filter("currency")
      return currency(amount, currencySymbol).replace("(", "-").replace(")", "")  if amount < 0
      currency amount, currencySymbol
]
