@weowepro.factory 'Users', [
  '$resource'
  ($resource) ->
    $resource('/users/:id.json', null,
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'

      destroy:
        method: 'DELETE'
    )
]
