'use strict'

describe 'PlaylistService', ->
  PlaylistService = {}

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
      PlaylistService.new(mockVideos)

    it 'creates the service with provided videos', ->
      for idx, video  of PlaylistService.videos
        expect(mockVideos[idx]).toEqual video

  describe '#play', ->
    beforeEach ->
      PlaylistService.new(mockVideos)

    describe 'when in range', ->
      it 'plays the video', ->
        PlaylistService.play(2)
        expect(PlaylistService.current()).toEqual mockVideos[2]

    describe 'when out of range', ->
      it 'throws an error', ->
        expect( -> PlaylistService.play(-1)).toThrow(new Error("Index out of playlist range: (-1)"))
        expect( -> PlaylistService.play(4)).toThrow(new Error("Index out of playlist range: (4)"))

  describe '#playNext', ->
    describe 'when repeating', ->
      beforeEach ->
        PlaylistService.new(mockVideos)

      describe 'when in range', ->
        it 'moves the current index to next', ->
          PlaylistService.playNext()
          expect(PlaylistService.current()).toEqual mockVideos[1]

      describe 'when out of range', ->
        it 'moves the current index to first video', ->
          PlaylistService.playNext() for video in mockVideos
          expect(PlaylistService.current()).toEqual mockVideos[0]


    describe 'when not repeating', ->
      beforeEach ->
        PlaylistService.new(mockVideos, false)

      describe 'when in range', ->
        it 'moves the current index to next', ->
          PlaylistService.playNext()
          expect(PlaylistService.current()).toEqual mockVideos[1]

      describe 'when out of range', ->
        it 'doesn\'t move the index', ->
          PlaylistService.playNext() for video in mockVideos
          expect(PlaylistService.current()).toEqual mockVideos[mockVideos.length - 1]

  describe '#playPrevious', ->
    describe 'when repeating', ->
      beforeEach ->
        PlaylistService.new(mockVideos)

      describe 'when in range', ->
        it 'moves the current index to previous', ->
          PlaylistService.play(mockVideos.length - 1)
          PlaylistService.playPrevious()
          expect(PlaylistService.current()).toEqual mockVideos[mockVideos.length - 2]

      describe 'when out of range', ->
        it 'moves the current index to last video', ->
          PlaylistService.playPrevious()
          expect(PlaylistService.current()).toEqual mockVideos[mockVideos.length - 1]


    describe 'when not repeating', ->
      beforeEach ->
        PlaylistService.new(mockVideos, false)

      describe 'when in range', ->
        it 'moves the current index to previous', ->
          PlaylistService.play(mockVideos.length - 1)
          PlaylistService.playPrevious()
          expect(PlaylistService.current()).toEqual mockVideos[mockVideos.length - 2]

      describe 'when out of range', ->
        it 'doesn\'t move the index', ->
          PlaylistService.playPrevious()
          expect(PlaylistService.current()).toEqual mockVideos[0]

