$(function() {
  dispatcher = new WebSocketRails($('#echo').data('uri'), true)
  document.querySelector('button#fire').onclick = function() {
    send(document.querySelector('#send').value);
    document.querySelector('#send').value = '';
  };

  dispatcher.bind('new_message',
		  function(message) {
		    document.querySelector('#messages').innerHTML += '<li>' + message + '</li>';
		  })


  var dispatcher2 = new WebSocketRails('localhost:9292/websocket')

  var channel = dispatcher2.subscribe('special_channel');

  channel.bind('new_message', function(data) {
    console.log('channel event received: ' + data);
  });


});

function send(message) {
  dispatcher.trigger('blah_message', message);
}
