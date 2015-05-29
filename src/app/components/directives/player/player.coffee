mod = angular.module('staff-picks.player', ['debounce'])


mod.service 'PlayerService', ($window) ->

  RATIO = 1920 / 1080

  self =
    resize: (element) ->
      element.find('iframe').css('height', $window.innerWidth / RATIO + 'px')

  return self

mod.directive "player", ($sce, $window, debounce, PlayerService) ->
  restrict: 'E'
  templateUrl: 'app/components/directives/player/player.html'
  scope:
    src: '='
    autoPlay: '='
  link: (scope, element, attrs) ->
    # Debounce the callback for performance
    # since resize event could be fired multiple times while dragging the window
    resize = debounce(PlayerService.resize, 500)

    resize(element)

    angular.element($window).on 'resize', ->
      resize(element)

    scope.trustedSrc = ->
      $sce.trustAsResourceUrl("#{scope.src}?autoplay=#{scope.autoPlay}")



