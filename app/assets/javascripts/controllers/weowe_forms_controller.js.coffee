@weowepro.controller 'WeoweFormsCtrl', [
  '$scope',
  'WeoweForms',
  'Users',
  'Sales'
  '$modal'

  @WeoweFormsCtrl = ($scope, WeoweForms, Users, Sales, $modal) ->
    $scope.weoweForms = WeoweForms.index()
    $scope.weoweUsers = Users.index()
    $scope.salesStaff = Sales.index()

    $scope.predicate =
      value: '-custom_date'

    $scope.predicateUsers =
      value: 'last_name'

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 25

    $scope.formStatus = (form) ->
      if form.pending is true and form.completed is false then 'Pending'
      else if form.pending is false and form.completed is false then 'Service'
      else 'Completed'

    $scope.progressBarType = (form) ->
      if form.pending is true and form.completed is false then 'danger'
      else if form.pending is false and form.completed is false then 'warning'
      else 'success'

    $scope.approve = ->
      WeoweForms.update id: $scope.data.weoweForm.id,
        pending: false
        completed: false

    $scope.returnSales = ->
      WeoweForms.update id: $scope.data.weoweForm.id,
        pending: true
        completed: false

    $scope.returnService = ->
      WeoweForms.update id: $scope.data.weoweForm.id,
        pending: false
        completed: false

    $scope.open = () ->
      modalInstance = $modal.open
        templateUrl: 'actual-value.html',
        controller: WeoweFormsModalCtrl,
        scope: $scope
        resolve:
          data: ->
            weoweForm: $scope.data.weoweForm

    WeoweFormsModalCtrl = ($scope, $modalInstance) ->

      $scope.ok = ->
        WeoweForms.update id: $scope.data.weoweForm.id,
          dealer_actual_1: $scope.data.weoweForm.dealer_actual_1
          dealer_actual_2: $scope.data.weoweForm.dealer_actual_2
          dealer_actual_3: $scope.data.weoweForm.dealer_actual_3
          dealer_actual_4: $scope.data.weoweForm.dealer_actual_4
          dealer_actual_5: $scope.data.weoweForm.dealer_actual_5
          pending: false
          completed: true
          $modalInstance.close

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      WeoweFormsModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
      ]
]
