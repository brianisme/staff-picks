angular.module 'staffPicks', [
  'ngAnimate',
  'ngCookies',
  'ngTouch',
  'ngSanitize',
  'ngResource',
  'ngRoute',
  'duParallax',
  'ui.bootstrap',
  'ui.router',
  'staff-picks.resources',
  'staff-picks.services',
  'staff-picks.player'
  ]
  .config ($stateProvider, $urlRouterProvider) ->

    # Unmatched urls
    $urlRouterProvider.otherwise ($injector) ->
      $injector.get('$state').go('app')

    $stateProvider

      # Application states
      .state 'app',
        url: '/'
        templateUrl: "app/main/main.html"
        controller: "MainCtrl as main"
        resolve:
          videos: (ChannelService) ->
            ChannelService.getVideos('staffpicks')
          playlist: (PlaylistService, videos) ->
            PlaylistService.init(videos)
            PlaylistService.getInstance()
