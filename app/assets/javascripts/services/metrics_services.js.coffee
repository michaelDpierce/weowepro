@weowepro.factory 'Sales', ['$resource',
  ($resource) ->
    $resource('/metrics.json', {}, { index: { method: 'GET', isArray: true}})
]
