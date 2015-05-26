angular.module "staffPicks"
  .controller "MainCtrl", ($scope, Channels) ->
    videos = Channels.getVideos ->
      console.log videos[0].url

