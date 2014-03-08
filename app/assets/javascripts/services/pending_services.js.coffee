@weowepro.factory 'PendingForms', ['$resource',
  ($resource) ->
    $resource('/pending.json', {}, { index: { method: 'GET', isArray: true}})
]
