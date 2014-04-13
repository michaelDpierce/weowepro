@weowepro.factory 'PendingForms', [
  '$resource'
  ($resource) ->
    $resource('/pending/:id.json', {id: '@id'},
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
