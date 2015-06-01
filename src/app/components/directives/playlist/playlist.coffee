mod = angular.module('staff-picks.playlist', ['duScroll'])

mod.directive "playlist", ($sce, $window, $location, $document) ->
  restrict: 'E'
  templateUrl: 'app/components/directives/playlist/playlist.html'
  scope:
    playlist: '='
  link: (scope, element, attrs) ->
    scope.videos = scope.playlist.videos
    scope.play = (idx) ->
      $document.scrollTop(0, 1000)
      scope.playlist.play(idx)

    scope.showPlaylist = ->
      $document.scrollToElement(element[0].querySelector('.playlist'), $window.innerHeight / 2, 1000)
