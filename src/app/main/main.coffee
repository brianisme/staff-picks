angular.module "staffPicks"
  .controller "MainCtrl", ($scope, $location, parallaxHelper, PlaylistService, videos) ->

    $scope.background = parallaxHelper.createAnimator(-0.6)

    PlaylistService.new(videos)

