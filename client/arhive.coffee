self = @
Meteor.subscribe "chats"
Meteor.subscribe "msgs"


Template.arhive.filter = ->
  Session.get 'arhFilter'

# Template.arhive.helpers


Template.arhive.items = ->
  if Session.get 'arhFilter'
    re = new RegExp Session.get 'arhFilter', 'gim'
    self.msgs.find text:re



Template.arhive.events
  'keyup input.filter':(e)->
    value = e.target.value.replace(/\n|^\s+|\s+$/g,'')
    if e.keyCode is 13 and value
      Session.set 'arhFilter', value

  'click a.open':(e)->
    e.preventDefault()
    Session.set 'chatId', @chatId