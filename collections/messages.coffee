self = @
###

  text     :  String
  chat     :  id

###

@chats = new Meteor.Collection 'chats'
@msgs = new Meteor.Collection 'msgs'

@msgs.allow
  insert: (userId, doc)->
    true
  update:(userId, docs, fields, modifier)->
    true if docs.owner is userId
  remove:  (userId, docs)->
    true if docs.owner is userId

@chats.allow
  insert: (userId, doc)->
    true
  update:(userId, docs, fields, modifier)->
    true
  remove:  (userId, docs)->
    true if docs.owner is userId

if Meteor.isServer
  Meteor.methods
    'role':()->
      user = Meteor.users.findOne @userId
      user.role if user?.role

  Meteor.publish "msgs", ->
    self.msgs.find()

  Meteor.publish "chats", ->
    self.chats.find {}, {sort:online:-1}