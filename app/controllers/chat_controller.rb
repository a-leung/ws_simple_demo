class ChatController < WebsocketRails::BaseController
  def new_message
    puts 'new_message: ' + message
    broadcast_message :new_message, 'Echo: ' + message
    self.model_trigger
  end

  def model_trigger
    @m ||= Mymodel.new
    @m.publish_to_channel
  end
end
