angular.module "staffPicks"
  .controller "MainCtrl", ($scope, parallaxHelper, ChannelService) ->
    $scope.background = parallaxHelper.createAnimator(-0.6)
    $scope.videos = ChannelService.getVideos()
    $scope.currentVideo = ->
      "https://player.vimeo.com/video/#{$scope.videos[0].id}" if $scope.videos[0]?
