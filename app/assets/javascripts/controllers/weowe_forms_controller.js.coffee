@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 50

    # $scope.customMsg = (form) ->
    #   YES = "Service has been completed for #{form.customer_first_name}
    #         #{form.customer_last_name} and they have been notified by email."
    #   NO = "Service has been completed for #{form.customer_first_name}
    #         #{form.customer_last_name}. Please notifiy by phone at
    #         #{form.customer_phone_mobile}."
    #   message = if form.customer_email then YES else NO

    # $scope.customAlert = (form) ->
    #   alert = if form.customer_email then 'success' else 'info'

    $scope.alerts = []

    $scope.addAlert = ->
      $scope.alerts = []
      $scope.alerts.push
        type: 'info'
        msg: 'message'

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.deleteRow = (form) ->
      $scope.weoweForms.splice $scope.weoweForms.indexOf(form), 1

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
