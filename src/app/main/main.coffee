angular.module "staffPicks"
  .controller "MainCtrl", ($scope, parallaxHelper, playlist) ->

    $scope.background = parallaxHelper.createAnimator(-0.3)
    $scope.playlist = playlist

