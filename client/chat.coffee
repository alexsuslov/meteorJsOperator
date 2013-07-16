self = @
Meteor.subscribe  "msgs"

Template.chat.items = ->
  self.msgs.find chatId: Session.get 'chatId'