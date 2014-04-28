@weowepro.factory 'CompletedForms', ['$resource',
  ($resource) ->
    $resource('/completed.json', {}, { index: { method: 'GET', isArray: true}})
]
