Template.main.helpers
  'opr':()->
    role = Session.get 'role'
    role.operator if role?.operator and Meteor.userId()
