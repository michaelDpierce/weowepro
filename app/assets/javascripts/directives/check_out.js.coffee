@weowepro.directive 'checkOut', ->
  restrict: 'E'
  templateUrl: '/check_out'
  scope:
    form: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.form.completed = false
      scope.form.pending = false

      scope.form.$update (newForm, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newForm
