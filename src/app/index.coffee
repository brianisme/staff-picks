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
        resolve:
          videos: (ChannelService) ->
            ChannelService.getVideos('staffpicks')
          playlist: (PlaylistService, videos) ->
            PlaylistService.new(videos)
