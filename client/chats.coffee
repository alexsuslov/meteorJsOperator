self = @

Template.chats.items = ->
  Meteor.subscribe "chats"
  self.chats.find()

Template.chats.events
  'click a.open':(e)->
    e.preventDefault()
    Session.set 'chatId', @_id