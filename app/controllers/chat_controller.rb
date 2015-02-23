class ChatController < WebsocketRails::BaseController
  def new_message
    puts 'new_message: ' + message
    broadcast_message :new_message, 'Echo: ' + message
  end
end
