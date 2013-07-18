Deps.autorun ()->
  Meteor.call 'role', Meteor.userId(), (error, result)->
    Session.set 'role', result if result
Meteor.logout ()->
  Session.set 'role', false


