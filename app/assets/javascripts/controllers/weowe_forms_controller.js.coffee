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
        controller: WeoweFormsCompletedModalCtrl,
        scope: $scope
        resolve:
          data: ->
            weoweForm: $scope.data.weoweForm

    $scope.edit = () ->
      modalInstance = $modal.open
        templateUrl: 'weoweform-edit.html',
        controller: WeoweFormsEditModalCtrl,
        scope: $scope
        resolve:
          data: ->
            weoweForm: $scope.data.weoweForm

    WeoweFormsCompletedModalCtrl = ($scope, $modalInstance) ->

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

      WeoweFormsCompletedModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
      ]

    WeoweFormsEditModalCtrl = ($scope, $modalInstance) ->

      $scope.ok = ->

        WeoweForms.update id: $scope.data.weoweForm.id,
          customer_first_name: $scope.data.weoweForm.customer_first_name
          customer_last_name: $scope.data.weoweForm.customer_last_name
          customer_phone_mobile: $scope.data.weoweForm.customer_phone_mobile
          customer_email: $scope.data.weoweForm.customer_email
          # Add additional fields here
          $modalInstance.close
          toastr.info('We Owe Form was successfully updated.')
        return true #Fixes error with returns elements through Angular to the DOM

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      WeoweFormsEditModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
      ]
]
