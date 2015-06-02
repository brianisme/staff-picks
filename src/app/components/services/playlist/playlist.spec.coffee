'use strict'

describe 'PlaylistService', ->
  PlaylistService = {}
  playlist = {}

  mockVideos = [
    { id: 1 },
    { id: 2 },
    { id: 3 },
    { id: 4 }
  ]

  beforeEach angular.mock.module 'staff-picks.services'

  beforeEach inject (_PlaylistService_) ->
    PlaylistService = _PlaylistService_

  describe '#new', ->
    beforeEach ->
      playlist = PlaylistService.init(mockVideos)

    it 'creates the service with provided videos', ->
      for idx, video of playlist.videos
        expect(mockVideos[idx]).toEqual video

  describe '#play', ->
    beforeEach ->
      playlist = PlaylistService.init(mockVideos)

    describe 'when in range', ->
      it 'plays the video', ->
        playlist.play(2)
        expect(playlist.current()).toEqual mockVideos[2]

    describe 'when out of range', ->
      it 'throws an error', ->
        expect( -> playlist.play(-1)).toThrow(new Error("Index out of playlist range: (-1)"))
        expect( -> playlist.play(4)).toThrow(new Error("Index out of playlist range: (4)"))

  describe '#playNext', ->
    describe 'when repeating', ->
      beforeEach ->
        playlist = PlaylistService.init(mockVideos)

      describe 'when in range', ->
        it 'moves the current index to next', ->
          playlist.playNext()
          expect(playlist.current()).toEqual mockVideos[1]

      describe 'when out of range', ->
        it 'moves the current index to first video', ->
          playlist.playNext() for video in mockVideos
          expect(playlist.current()).toEqual mockVideos[0]


    describe 'when not repeating', ->
      beforeEach ->
        playlist = PlaylistService.init(mockVideos, false)

      describe 'when in range', ->
        it 'moves the current index to next', ->
          playlist.playNext()
          expect(playlist.current()).toEqual mockVideos[1]

      describe 'when out of range', ->
        it 'doesn\'t move the index', ->
          playlist.playNext() for video in mockVideos
          expect(playlist.current()).toEqual mockVideos[mockVideos.length - 1]

  describe '#playPrevious', ->
    describe 'when repeating', ->
      beforeEach ->
        playlist = PlaylistService.init(mockVideos)

      describe 'when in range', ->
        it 'moves the current index to previous', ->
          playlist.play(mockVideos.length - 1)
          playlist.playPrevious()
          expect(playlist.current()).toEqual mockVideos[mockVideos.length - 2]

      describe 'when out of range', ->
        it 'moves the current index to last video', ->
          playlist.playPrevious()
          expect(playlist.current()).toEqual mockVideos[mockVideos.length - 1]


    describe 'when not repeating', ->
      beforeEach ->
        playlist = PlaylistService.init(mockVideos, false)

      describe 'when in range', ->
        it 'moves the current index to previous', ->
          playlist.play(mockVideos.length - 1)
          playlist.playPrevious()
          expect(playlist.current()).toEqual mockVideos[mockVideos.length - 2]

      describe 'when out of range', ->
        it 'doesn\'t move the index', ->
          playlist.playPrevious()
          expect(playlist.current()).toEqual mockVideos[0]

