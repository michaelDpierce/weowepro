@weowepro.directive 'checkOut', ->
  restrict: 'E'
  templateUrl: '/check_out'
  replace: true
  scope:
    form: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.form.completed = false
      scope.form.pending = false
      scope.form.approved_trigger = true

      scope.form.$update (newForm, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newForm
