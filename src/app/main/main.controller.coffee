angular.module "staffPicks"
  .controller "MainCtrl", ($scope, parallaxHelper, Channels) ->
    $scope.background = parallaxHelper.createAnimator(-0.6, 250, -150)
    $scope.videos = Channels.getVideos()


