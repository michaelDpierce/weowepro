@weowepro.directive "match", ($parse) ->
  require: "ngModel"
  link: (scope, elem, attrs, ctrl) ->
    scope.$watch (->
      $parse(attrs.match)(scope) is ctrl.$modelValue
    ), (currentValue) ->
      ctrl.$setValidity "mismatch", currentValue
      return

    return
