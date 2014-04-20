@weowepro.directive 'complete', ->
  restrict: 'E'
  templateUrl: '/complete'
  replace: true
  scope:
    form: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.form.completed = true
      scope.form.pending = false
      scope.form.completed_trigger = true

      scope.form.$update (newForm, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newForm
