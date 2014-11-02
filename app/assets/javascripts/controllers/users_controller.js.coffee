@weowepro.controller 'UsersCtrl', [
  '$scope',
  'Users',
  '$modal'

  @UsersCtrl = ($scope, Users, $modal) ->
    $scope.weoweUsers = Users.index()

    $scope.predicate =
      value: 'last_name'

    $scope.showActive = true

    $scope.options = ['F&I', 'Sales', 'Service', 'Unassigned']

    $scope.adminButton = (employee) ->
      if employee.admin
        employeeData = angular.extend employee,
          admin: false
        Users.update id: $scope.data.user.id, employeeData
        .$promise.then (employeeData) ->
          $scope.weoweUsers.push employeeData
          toastr.error('Employee administrative rights have been invoked.')
      else
        employeeData = angular.extend employee,
          admin: true
        Users.update id: $scope.data.user.id, employeeData
        .$promise.then (employeeData) ->
          $scope.weoweUsers.push employeeData
          toastr.success('Employee administrative rights have been granted.')

    $scope.activeButton = (employee) ->
      if employee.active
        employeeData = angular.extend employee,
          active: false
        Users.update id: $scope.data.user.id, employeeData
        .$promise.then (employeeData) ->
          $scope.weoweUsers.push employeeData
          toastr.error('Employee has been deactivated')
      else
        employeeData = angular.extend employee,
          active: true
        Users.update id: $scope.data.user.id, employeeData
        .$promise.then (employeeData) ->
          $scope.weoweUsers.push employeeData
          toastr.success('Employee has been activated.')

    $scope.open = (editMode, passwordChange) ->
      modalInstance = $modal.open
        templateUrl: 'user-form.html',
        controller: UsersModalCtrl,
        scope: $scope
        resolve:
          editMode: -> editMode
          passwordChange: -> passwordChange
          user: ->
            user: $scope.user

    $scope.changePassword = ->
      modalInstance = $modal.open
        templateUrl: 'user-form-password.html',
        controller: UsersPasswordModalCtrl,
        scope: $scope
        resolve:
          user: ->
            user: $scope.user

    UsersModalCtrl = ($scope, $modalInstance, editMode, passwordChange) ->

      $scope.editMode = editMode
      $scope.passwordChange = passwordChange

      $scope.create = ->
        Users.create
          first_name: $scope.user.first_name
          last_name: $scope.user.last_name
          phone_number: $scope.user.phone_number
          email: $scope.user.email
          admin: false
          active: true
          department: $scope.user.department
          password: $scope.user.password
          password_confirmation: $scope.user.password_confirmation
          dealer_id: $scope.dealer_id

        .$promise.then (newEmployee) ->
          $scope.weoweUsers.push newEmployee
          console.log newEmployee
          toastr.success('Employee has been successfully created.')
          $modalInstance.close newEmployee

      $scope.update = ->
        employeeData =
          id: $scope.data.user.id
          first_name: $scope.data.user.first_name
          last_name: $scope.data.user.last_name
          phone_number: $scope.data.user.phone_number
          email: $scope.data.user.email
          admin: $scope.data.user.admin
          active: $scope.data.user.active
          department: $scope.data.user.department

        Users.update id: employeeData.id, employeeData
        .$promise.then (updateEmployee) ->
          $scope.weoweUsers.push updateEmployee
          toastr.info('Employee has been successfully updated.')
          $modalInstance.close updateEmployee

      $scope.changePassword = ->
        employeeData =
          id: $scope.data.user.id
          password: $scope.data.user.password
          password_confirmation: $scope.data.user.password_confirmation

        Users.update id: employeeData.id, employeeData
        .$promise.then (updateEmployee) ->
          $scope.weoweUsers.push updateEmployee
          toastr.info('Password has been successfully updated.')
          $modalInstance.close updateEmployee

      $scope.cancel = ->
        $modalInstance.dismiss "Cancel"

      UsersModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'editMode'
        'passwordChange'
      ]
]
