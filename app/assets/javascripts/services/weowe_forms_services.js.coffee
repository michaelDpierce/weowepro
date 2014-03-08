@weowepro.factory 'WeoweForms', ['$resource',
  ($resource) ->
    $resource('/weowe_forms.json', {}, { index: { method: 'GET', isArray: true}})
]
