@weowepro.directive "datepicker", ->
  restrict: "A"
  require: "ngModel"
  link: (scope, elem, attrs, ngModelCtrl) ->
    updateModel = (dateText) ->
      scope.$apply ->
        ngModelCtrl.$setViewValue dateText
        return

      return

    options =
      dateFormat: "dd-mm-yy"
      onSelect: (dateText) ->
        updateModel dateText
        return

    elem.datepicker options
    return
