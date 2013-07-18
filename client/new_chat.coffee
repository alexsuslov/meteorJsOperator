self = @
Meteor.subscribe "chats"
Meteor.subscribe "msgs"

Template.newChats.helpers
  'onLine':->
    localTime = new Date().getTime()
    time= 30 * 1000
    if localTime - time < @online
      'online'
    else
      'offline'
  'last':->
    msgs = self.msgs.find
      chatId:@_id
    ,
      sort:time : -1
      limit : 1
    msg = msgs.fetch()
    return msg[0].text if  msg?[0]?.text
    'chat'

Template.newChats.items = ->
  timeLine = new Date().getTime()
  timeLine -= 30 * 1000
  self.chats.find {operator:{$exists:false}},{online:{$gt:timeLine}}

Template.newChats.events
  'click a.open':(e)->
    e.preventDefault()
    self.chats.update @_id, $set:operator:Meteor.userId()
    Session.set 'chatId', @_id