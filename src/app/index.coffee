angular.module 'staffPicks', [
  'ngAnimate',
  'ngCookies',
  'ngTouch',
  'ngSanitize',
  'ngResource',
  'ngRoute',
  'duParallax',
  'ui.bootstrap',
  'staff-picks.resources',
  'staff-picks.services',
  'staff-picks.player'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl as main"
      .otherwise
        redirectTo: "/"

