angular.module "staffPicks"
  .controller "MainCtrl", ($scope, $location, parallaxHelper, ChannelService, PlaylistService) ->
    $scope.background = parallaxHelper.createAnimator(-0.6)
    $scope.videos = ChannelService.getVideos()

    $scope.currentVideo = ->
      "#{$location.protocol()}://player.vimeo.com/video/#{$scope.videos[0].id}" if $scope.videos[0]?
