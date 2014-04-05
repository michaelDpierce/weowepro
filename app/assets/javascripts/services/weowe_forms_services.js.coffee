@weowepro.factory 'WeoweForms', [
  '$resource'
  ($resource) ->
    $resource('/weowe_forms/:id.json', {id: '@id'},
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
