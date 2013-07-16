self= @
Meteor.subscribe "pages"

isUser = (usersPage, anonPage)->
  anonPage = 'main' unless anonPage
  if Meteor.userId
    usersPage
  else
    anonPage

Meteor.Router.add
  '': 'main'
  '/sigin':'auth'

  Template.body.helpers
    layoutName:()->
      if Meteor.Router.page()
        Meteor.Router.page()
      else
        '404'