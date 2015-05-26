
angular.module('app.resources').factory 'Channels', ($resource) ->
  $resource 'http://vimeo.com/api/v2/channel/:id/:attr', { id: 'staffpicks' },
    getVideos:
      method: 'GET'
      params:
        attr: 'videos.json'
      isArray: true

