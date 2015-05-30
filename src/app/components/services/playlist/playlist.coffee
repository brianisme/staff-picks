angular.module('staff-picks.services').service 'PlaylistService', ($q) ->

  self =
    new: (videos, repeat=true) ->
      @currentIdx = 0
      @videos = videos
      @repeat = repeat

    play: (idx) ->
      throw Error("Index out of playlist range: (#{idx})") if idx < 0 or idx > @videos.length - 1
      @currentIdx = idx
      @videos[idx]

    current: ->
      @videos[@currentIdx]

    playNext: () ->
      if @currentIdx < @videos.length - 1
        idx = @currentIdx + 1
      else if @repeat
        idx = 0
      else
        return

      @play(idx)

    playPrevious: ->
      if @currentIdx > 0
        idx = @currentIdx - 1
      else if @repeat
        idx = @videos.length - 1
      else
        return

      @play(idx)


  return self
