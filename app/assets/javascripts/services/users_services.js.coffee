@weowepro.factory 'Users', ['$resource',
  ($resource) ->
    $resource('/users.json', {}, { index: { method: 'GET', isArray: true}})
]
