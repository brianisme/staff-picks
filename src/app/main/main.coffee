angular.module "staffPicks"
  .controller "MainCtrl", ($scope, $location, parallaxHelper, PlaylistService, playlist) ->

    $scope.background = parallaxHelper.createAnimator(-0.6)

    $scope.playlist = playlist

