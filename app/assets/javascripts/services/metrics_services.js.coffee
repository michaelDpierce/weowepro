@weowepro.factory 'Metrics', ['$resource',
  ($resource) ->
    $resource('/metrics.json', {}, { index: { method: 'GET', isArray: true}})
]
