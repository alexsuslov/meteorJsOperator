@PlaySound = (soundObj)->
  $("#favicon").attr("href","/img/on.png");
  $('#' + soundObj)[0].play()

Meteor.startup ()->
  $('<audio id="notify"><source src="/sound/notify.mp3" type="audio/mpeg"></audio>').appendTo('body');  
  $('<audio id="message">
    <source src="/sound/message.mp3" type="audio/mpeg">
    </audio>').appendTo('body');   
  $('<audio id="typing">
    <source src="/sound/typing.mp3" type="audio/mpeg">
    </audio>').appendTo('body');
