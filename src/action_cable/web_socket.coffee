class ActionCable.WebSocket
  constructor: (@url, protocols) ->
    @state = "closed"
    @protocol = protocols[0]

    @onmessage = ->
    @onopen = ->
    @onclose = ->
    @onerror = ->

    @open()

  getState: ->
    @state

  open: ->
    @state = "connecting"
    wx.connectSocket(
      url: @url
      header:
        "content-type": "application/json"
      fail: =>
        @state = "closed"
    )

  close: ->
    if @state == "open"
      @state = "closing"
      wx.closeSocket()

  send: (data) ->
    wx.sendSocketMessage(
      data: data
    )

  Object.defineProperty @prototype, "onmessage",
    set: (@onmessageEvent) ->
      wx.onSocketMessage(
        (event) =>
          @onmessageEvent(event)
      )

  Object.defineProperty @prototype, "onopen",
    set: (@onopenEvent) ->
      wx.onSocketOpen(
        (event) =>
          @state = "open"
          @onopenEvent(event)
      )

  Object.defineProperty @prototype, "onclose",
    set: (@oncloseEvent) ->
      wx.onSocketClose(
        (event) =>
          @state = "closed"
          @oncloseEvent(event)
      )

  Object.defineProperty @prototype, "onerror",
    set: (@onerrorEvent) ->
      wx.onSocketError(
        (event) =>
          @onerrorEvent(event)
      )
