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
});

function send(message) {
  dispatcher.trigger('new_message', message);
}
