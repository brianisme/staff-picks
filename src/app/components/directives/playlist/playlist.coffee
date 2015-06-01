mod = angular.module('staff-picks.playlist', [])

mod.directive "playlist", ($sce, $window, $location) ->
  restrict: 'E'
  templateUrl: 'app/components/directives/playlist/playlist.html'
  scope:
    playlist: '='
  link: (scope, element, attrs) ->
    scope.videos = scope.playlist.videos
    scope.play = (idx) ->
      scope.playlist.play(idx)
