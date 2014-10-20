@weowepro = angular.module 'weowepro',
  [
    'templates',
    'ngResource',
    'weoweproFilters',
    'ngAnimate',
    'ngSanitize',
    'ui.bootstrap']

@weoweproFilters = angular.module 'weoweproFilters', []
