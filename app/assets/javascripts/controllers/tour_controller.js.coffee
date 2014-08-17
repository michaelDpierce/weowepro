@weowepro.controller 'TourCtrl', ['$scope', '$http',
  @Tour = ($scope, $http) ->

    $scope.screenshots = [
      {
        name: "Dashboard"
        url: "dashboard.png"
        description: "This page is designed to provide quick access to navigation
        and allow you to see the most recent activity."
      }
      {
        name: "New We Owe Form"
        url: "form_new.png"
        description: "The standard we owe submission form. Drop down boxes provide
        speedy form creation and form validation prevents incomplete forms from being submitted."
      }
      {
        name: "Form Page"
        url: "form.png"
        description: "This page contains all the form information. Also, it will
        track which salesperson submitted and approved the form."
      }
      {
        name: "Sales Index"
        url: "sales.png"
        description: "The Sales index allows employees to search for forms and
        or sort by each category header."
      }
      {
        name: "Service Index"
        url: "service.png"
        description: "The Service index allows employees to search for forms and
        or sort by each category header."
      }
      {
        name: "Completed Index"
        url: "completed.png"
        description: "The Completed index allows employees to search for forms and
        or sort by each category header."
      }
      {
        name: "Add New Employee"
        url: "user_new.png"
        description: "As you add staff you can create additional employee accounts."
      }
      {
        name: "Employee Profile"
        url: "user_profile.png"
        description: "Employees can view and edit their information here. managers
        have the ability to give users admin access from this page."
      }
      {
        name: "Employees Index"
        url: "users.png"
        description: "The Employees index allows managers to search for employees."
      }
    ]
    $scope.screenshotImage = $scope.screenshots[0] # dashboard
]
