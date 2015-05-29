angular.module('staff-picks.services').service 'ChannelService', ($q, Channels) ->

  _channel = null
  _videos  = []


  self =
    # init: (channel_id) ->
    #   return $q.when(self) if
    getVideos: ->
      return $q.when(self.videos) if self.videos?
      Channels.getVideos()
