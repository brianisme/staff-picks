angular.module('staff-picks.services').service 'ChannelService', ($q, Channels) ->

  self =
    getVideos: (channel_id) ->
      Channels.getVideos(id: channel_id).$promise

  return self
