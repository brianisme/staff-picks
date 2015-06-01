angular.module('staff-picks.resources').factory 'Channels', ($resource) ->
  $resource '//vimeo.com/api/v2/channel/:id/:attr', {},
    getVideos:
      method: 'GET'
      params:
        attr: 'videos.json'
      isArray: true
