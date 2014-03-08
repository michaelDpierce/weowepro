@weowepro.factory 'ClosedForms', ['$resource',
  ($resource) ->
    $resource('/closed.json', {}, { index: { method: 'GET', isArray: true}})
]
