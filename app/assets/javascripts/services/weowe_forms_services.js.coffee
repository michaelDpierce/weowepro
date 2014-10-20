@weowepro.factory 'WeoweForms', [
  '$resource'
  ($resource) ->
    $resource('/weowe_forms/:id.json', null,
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
