Template.main.events
  'click button.play':(e)->
    t = setTimeout ()->
      self.PlaySound 'notify'
      self.PlaySound 'message'
      self.PlaySound 'typing'
    ,5000