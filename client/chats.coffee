self = @
Session.set 'workTimeLine', 60 * 60 * 1000

Meteor.subscribe "chats"
Meteor.subscribe "msgs"

Template.chats.helpers
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

Template.chats.items = ->
  timeLine = new Date().getTime()
  timeLine -= parseInt Session.get 'workTimeLine'


  self.chats.find {online:{$gt:timeLine}, operator:Meteor.userId()} , sort:online:-1

Template.chats.events
  'click a.open':(e)->
    e.preventDefault()
    Session.set 'chatId', @_id

  'click button':(e)->
    switch e.target.id
      when 'hour'
        timeLine = 60 * 60 * 1000
      when 'day'
        timeLine = 24 * 60 * 60 * 1000
      when 'week'
        timeLine = 7 * 24 * 60 * 60 * 1000
      when 'month'
        timeLine = 31 * 24 * 60 * 60 * 1000

    Session.set 'workTimeLine', timeLine if timeLine