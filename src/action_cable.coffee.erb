#= export ActionCable
#= require_self
#= require ./action_cable/consumer

@ActionCable =
  INTERNAL:
    message_types: {
      welcome: "welcome",
      ping: "ping",
      confirmation: "confirm_subscription",
      rejection: "reject_subscription"
    },
    default_mount_path: "/cable",
    protocols: ["actioncable-v1-json", "actioncable-unsupported"]

  createConsumer: (url) ->
    url ?= @INTERNAL.default_mount_path
    new ActionCable.Consumer url

  startDebugging: ->
    @debugging = true

  stopDebugging: ->
    @debugging = null

  log: (messages...) ->
    if @debugging
      messages.push(Date.now())
      console.log("ActionCable:", messages...)
