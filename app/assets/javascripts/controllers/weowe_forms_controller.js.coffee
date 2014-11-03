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

    $scope.showStar = (created_at) ->
      if moment(created_at).isAfter(moment().subtract('days', 1)) then true

    $scope.newHighlight = (created_at) ->
      if moment(created_at).isAfter(moment().subtract('minutes', 1)) then 'success'

    $scope.years = [2016..1950]

    $scope.today = ->
      $scope.dateSold = new Date()

    $scope.today()

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

    $scope.actualValue = () ->
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

    $scope.create = ->
      WeoweForms.create
        customer_first_name: $scope.data.newWeoweForm.customer_first_name
        customer_last_name: $scope.data.newWeoweForm.customer_last_name
        customer_phone_mobile: $scope.data.newWeoweForm.customer_phone_mobile
        customer_email: $scope.data.newWeoweForm.customer_email
        stock_number: $scope.data.newWeoweForm.stock_number
        year: $scope.data.newWeoweForm.year
        make: $scope.data.newWeoweForm.make
        vehicle_model: $scope.data.newWeoweForm.vehicle_model
        sold_date: $scope.dateSold
        description_1: $scope.data.newWeoweForm.description_1
        quantity_1: $scope.data.newWeoweForm.quantity_1
        dealer_total_value_1: $scope.data.newWeoweForm.dealer_total_value_1
        dealer_wholesale_1: $scope.data.newWeoweForm.dealer_wholesale_1
        description_2: $scope.data.newWeoweForm.description_2
        quantity_2: $scope.data.newWeoweForm.quantity_2
        dealer_total_value_2: $scope.data.newWeoweForm.dealer_total_value_2
        dealer_wholesale_2: $scope.data.newWeoweForm.dealer_wholesale_2
        description_3: $scope.data.newWeoweForm.description_3
        quantity_3: $scope.data.newWeoweForm.quantity_3
        dealer_total_value_3: $scope.data.newWeoweForm.dealer_total_value_3
        dealer_wholesale_3: $scope.data.newWeoweForm.dealer_wholesale_3
        description_4: $scope.data.newWeoweForm.description_4
        quantity_4: $scope.data.newWeoweForm.quantity_4
        dealer_total_value_4: $scope.data.newWeoweForm.dealer_total_value_4
        dealer_wholesale_4: $scope.data.newWeoweForm.dealer_wholesale_4
        description_5: $scope.data.newWeoweForm.description_5
        quantity_5: $scope.data.newWeoweForm.quantity_5
        dealer_total_value_5: $scope.data.newWeoweForm.dealer_total_value_5
        dealer_wholesale_5: $scope.data.newWeoweForm.dealer_wholesale_5
        theyowe_info: $scope.data.newWeoweForm.theyowe_info
        customer_total_value: $scope.data.newWeoweForm.customer_total_value
        assigned_sales_person_id: $scope.current_user.id

      .$promise.then (newWeoweForm) ->
        $scope.weoweUsers.push newWeoweForm
        console.log newWeoweForm
        toastr.success('We Owe Form has been successfully created.')

    WeoweFormsCompletedModalCtrl = ($scope, $modalInstance, WeoweForms, data) ->

      $scope.ok = ->
        da1 = if $scope.data.weoweForm.dealer_actual_1 then parseFloat($scope.data.weoweForm.dealer_actual_1) else ''
        da2 = if $scope.data.weoweForm.dealer_actual_2 then parseFloat($scope.data.weoweForm.dealer_actual_2) else ''
        da3 = if $scope.data.weoweForm.dealer_actual_3 then parseFloat($scope.data.weoweForm.dealer_actual_3) else ''
        da4 = if $scope.data.weoweForm.dealer_actual_4 then parseFloat($scope.data.weoweForm.dealer_actual_4) else ''
        da5 = if $scope.data.weoweForm.dealer_actual_5 then parseFloat($scope.data.weoweForm.dealer_actual_5) else ''
        $scope.data.weoweForm.dealer_total_actual = da1 + da2 + da3 + da4 + da5

        weoweFormData =
          id: $scope.data.weoweForm.id
          dealer_actual_1: da1
          dealer_actual_2: da2
          dealer_actual_3: da3
          dealer_actual_4: da4
          dealer_actual_5: da5
          dealer_total_actual: $scope.data.weoweForm.dealer_total_actual
          pending: false
          completed: true
          completed_by: 'Completed on '.concat(moment().format('MM-DD-YYYY @ h:mmA'))

        WeoweForms.update id: weoweFormData.id, weoweFormData
        .$promise.then (updateWeoweForm) ->
          $scope.weoweForms.push updateWeoweForm
          toastr.info('We Owe Form was successfully updated.')
          $modalInstance.close updateWeoweForm
          console.log weoweFormData

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      $scope.complete = ->
        weoweFormData =
          id: $scope.data.weoweForm.id
          pending: false
          completed: true
          completed_by: 'Completed on '.concat(moment().format('MM-DD-YYYY @ h:mmA'))

        WeoweForms.update id: weoweFormData.id, weoweFormData
        .$promise.then (updateWeoweForm) ->
          $scope.weoweForms.push updateWeoweForm
          toastr.info('We Owe Form was successfully updated.')
          $modalInstance.close updateWeoweForm

      WeoweFormsCompletedModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'WeoweForms'
        'data'
      ]

    WeoweFormsEditModalCtrl = ($scope, $modalInstance, WeoweForms, data) ->

      $scope.open = ($event) ->
        $event.preventDefault()
        $event.stopPropagation()
        $scope.opened = true

      $scope.dateOptions =
        formatYear: "yy"
        startingDay: 1

      $scope.update = ->
        dt1 = if $scope.data.weoweForm.dealer_total_value_1 then parseFloat($scope.data.weoweForm.dealer_total_value_1) else ''
        dt2 = if $scope.data.weoweForm.dealer_total_value_2 then parseFloat($scope.data.weoweForm.dealer_total_value_2) else ''
        dt3 = if $scope.data.weoweForm.dealer_total_value_3 then parseFloat($scope.data.weoweForm.dealer_total_value_3) else ''
        dt4 = if $scope.data.weoweForm.dealer_total_value_4 then parseFloat($scope.data.weoweForm.dealer_total_value_4) else ''
        dt5 = if $scope.data.weoweForm.dealer_total_value_5 then parseFloat($scope.data.weoweForm.dealer_total_value_5) else ''
        $scope.data.weoweForm.dealer_total_value = dt1 + dt2 + dt3 + dt4 + dt5

        dw1 = if $scope.data.weoweForm.dealer_wholesale_1 then parseFloat($scope.data.weoweForm.dealer_wholesale_1) else ''
        dw2 = if $scope.data.weoweForm.dealer_wholesale_2 then parseFloat($scope.data.weoweForm.dealer_wholesale_2) else ''
        dw3 = if $scope.data.weoweForm.dealer_wholesale_3 then parseFloat($scope.data.weoweForm.dealer_wholesale_3) else ''
        dw4 = if $scope.data.weoweForm.dealer_wholesale_4 then parseFloat($scope.data.weoweForm.dealer_wholesale_4) else ''
        dw5 = if $scope.data.weoweForm.dealer_wholesale_5 then parseFloat($scope.data.weoweForm.dealer_wholesale_5) else ''
        $scope.data.weoweForm.dealer_wholesale = dw1 + dw2 + dw3 + dw4 + dw5

        weoweFormData =
          id: $scope.data.weoweForm.id
          customer_first_name: $scope.data.weoweForm.customer_first_name
          customer_last_name: $scope.data.weoweForm.customer_last_name
          customer_phone_mobile: $scope.data.weoweForm.customer_phone_mobile
          customer_email: $scope.data.weoweForm.customer_email
          stock_number: $scope.data.weoweForm.stock_number
          year: $scope.data.weoweForm.year
          make: $scope.data.weoweForm.make
          vehicle_model: $scope.data.weoweForm.vehicle_model
          sold_date: $scope.data.weoweForm.sold_date
          description_1: $scope.data.weoweForm.description_1
          quantity_1: $scope.data.weoweForm.quantity_1
          dealer_total_value_1: dt1
          dealer_wholesale_1: dw1
          description_2: $scope.data.weoweForm.description_2
          quantity_2: $scope.data.weoweForm.quantity_2
          dealer_total_value_2: dt2
          dealer_wholesale_2: dw2
          description_3: $scope.data.weoweForm.description_3
          quantity_3: $scope.data.weoweForm.quantity_3
          dealer_total_value_3: dt3
          dealer_wholesale_3: dw3
          description_4: $scope.data.weoweForm.description_4
          quantity_4: $scope.data.weoweForm.quantity_4
          dealer_total_value_4: dt4
          dealer_wholesale_4: dw4
          description_5: $scope.data.weoweForm.description_5
          quantity_5: $scope.data.weoweForm.quantity_5
          dealer_total_value_5: dt5
          dealer_wholesale_5: dw5
          dealer_total_value: $scope.data.weoweForm.dealer_total_value
          dealer_wholesale: $scope.data.weoweForm.dealer_wholesale
          theyowe_info: $scope.data.weoweForm.theyowe_info
          customer_total_value: $scope.data.weoweForm.customer_total_value
          assigned_sales_person_id: $scope.data.salesPerson.id

        console.log weoweFormData

        WeoweForms.update id: weoweFormData.id, weoweFormData
        .$promise.then (updateWeoweForm) ->
          $scope.weoweForms.push updateWeoweForm
          toastr.info('We Owe Form was successfully updated.')
          $modalInstance.close updateWeoweForm

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      WeoweFormsEditModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'WeoweForms'
        'data'
      ]
]
