angular.module('staff-picks.services').service 'ChannelService', ($q, Channels) ->

  _channel = null
  _videos  = []

  self =
    getVideos: ->
      return $q.when(self.videos) if self.videos?
      Channels.getVideos()
