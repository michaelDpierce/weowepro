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
        approved_by: 'Approved on '.concat(moment().format('MM-DD-YYYY @ h:mmA'))
        completed_by: ''

    $scope.returnSales = ->
      WeoweForms.update id: $scope.data.weoweForm.id,
        pending: true
        completed: false
        approved_by: ''
        completed_by: ''

    $scope.returnService = ->
      WeoweForms.update id: $scope.data.weoweForm.id,
        pending: false
        completed: false
        approved_by: 'Approved on '.concat(moment().format('MM-DD-YYYY @ h:mmA'))
        completed_by: ''

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
        da1 = $scope.data.weoweForm.dealer_actual_1
        da2 = $scope.data.weoweForm.dealer_actual_2
        da3 = $scope.data.weoweForm.dealer_actual_3
        da4 = $scope.data.weoweForm.dealer_actual_4
        da5 = $scope.data.weoweForm.dealer_actual_5
        dta = parseFloat(da1) + parseFloat(da2) + parseFloat(da3) + parseFloat(da4) + parseFloat(da5)

        WeoweForms.update id: $scope.data.weoweForm.id,
          dealer_actual_1: da1
          dealer_actual_2: da2
          dealer_actual_3: da3
          dealer_actual_4: da4
          dealer_actual_5: da5
          dealer_total_actual:dta
          pending: false
          completed: true
          completed_by: 'Completed on '.concat(moment().format('MM-DD-YYYY @ h:mmA'))
          $modalInstance.close

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      WeoweFormsModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
      ]
]
