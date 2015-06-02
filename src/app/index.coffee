angular.module 'staffPicks', [
  'ngAnimate',
  'ngCookies',
  'ngTouch',
  'ngSanitize',
  'ngResource',
  'ngRoute',
  'duParallax',
  'duScroll',
  'ui.bootstrap',
  'ui.router',
  'staff-picks.resources',
  'staff-picks.services',
  'staff-picks.player',
  'staff-picks.playlist'
  ]
  .config ($stateProvider, $urlRouterProvider) ->

    # Unmatched urls
    $urlRouterProvider.otherwise ($injector) ->
      $injector.get('$state').go('app')

    $stateProvider

      # Application states
      .state 'app',
        url: '/:channel_id'
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
        resolve:
          videos: (ChannelService, $stateParams) ->
            ChannelService.getVideos($stateParams.channel_id)
          playlist: (PlaylistService, videos) ->
            PlaylistService.init(videos)
            PlaylistService.getInstance()
