@weowepro.controller 'WeoweFormsCtrl', [
  '$scope',
  'WeoweForms',
  'Users',
  'Sales'
  '$modal'

  @WeoweFormsCtrl = ($scope, WeoweForms, Users, Sales, $modal) ->
    angular.extend $scope
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

    $scope.open = () ->
      modalInstance = $modal.open
        templateUrl: 'actual-value.html',
        controller: WeoweFormsModalCtrl,
        scope: $scope
        resolve:
          data: ->
            weoweForm: $scope.data.weoweForm

    WeoweFormsModalCtrl = ($scope, $modalInstance) ->
      angular.extend $scope

      $scope.ok = ->
        console.log $scope.data.weoweForm.completed
        console.log $scope.data.weoweForm.pending
        $scope.data.weoweForm.pending = false
        $scope.data.weoweForm.pending = true
        WeoweForms.update id:  $scope.data.weoweForm.id
        console.log $scope.data.weoweForm.completed
        console.log $scope.data.weoweForm.pending
        $modalInstance.close

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      WeoweFormsModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
      ]
]
