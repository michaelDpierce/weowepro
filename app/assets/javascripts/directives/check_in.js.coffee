@weowepro.directive 'checkIn', ->
  restrict: 'E'
  template:"<button class='btn btn-success'>Complete</button>"
  scope:
    form: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.form.completed = true
      scope.form.pending = false

      scope.form.$update (newForm, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newForm
