@weowepro.controller 'TourCtrl', ['$scope', '$http',
  @Tour = ($scope, $http) ->

    $scope.screenshots = [
      {
        name: "Dashboard"
        url: "dashboard.png"
        description: "The Dashboard is designed to provide a quick overview of
                      form activity and multiple navigation links."
      }
      {
        name: "New We Owe Form"
        url: "new_form.png"
        description: "Standard template for new We Owe Form."
      }
      {
        name: "We Owe Form"
        url: "form.png"
        description: "The We Owe Form page shows all relevant We Owe Form
                      information and additional information about who
                      submitted and approved the form. Also, the navigation
                      links at the top of the page allow the form to be moved
                      between sections."
      }
      {
        name: "Sales Index"
        url: "sales.png"
        description: "The Sales index allows employees to search for We Owe
                      Forms and or sort by each category header to find the
                      desired form."
      }
      {
        name: "Service Index"
        url: "service.png"
        description: "The Service index allows employees to search for We Owe
                      Forms and or sort by each category header to find the
                      desired form."
      }
      {
        name: "Completed Index"
        url: "completed.png"
        description: "The Completed index allows employees to search for We Owe
                      Forms and or sort by each category header to find the
                      desired form."
      }
      {
        name: "Analytics"
        url: "analytics.png"
        description: "The Analytics page depicts the number of forms submitted
                      in each category and shows the total dollars per
                      category."
      }
      {
        name: "Add New Employee"
        url: "new_user.png"
        description: "Standard form used to add new staff memers."
      }
      {
        name: "Employee Profile"
        url: "user_profile.png"
        description: "Employees can view and edit their information here.
                      Managers have the ability to give users admin access
                      from this page or deactivate an employee from the app."
      }
      {
        name: "Employees Index"
        url: "staff.png"
        description: "The Employees index allows managers to search for
                      employees."
      }
      {
        name: "Dealership Settings"
        url: "dealership_settings.png"
        description: "This is the centeral location where the dealership
                      information can be edited and data can be exported."
      }
    ]

    $scope.count = 0
    $scope.screenshotImage = $scope.screenshots[0] # dashboard


]
