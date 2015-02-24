class ChatController < WebsocketRails::BaseController
  def new_message
    puts 'new_message: ' + message
    broadcast_message :new_message, 'Echo: ' + message
  end

  def blah_message
    puts 'blah message: ' + message
    broadcast_message :new_message, 'Echo: ' + message
    self.send_time
  end

  def send_time
    time = { 'time' => Time.zone.now.to_s }
    m = Mymodel.new
    WebsocketRails[:special_channel].trigger(:new_message, time.to_json )
    WebsocketRails[:special_channel].trigger(:new_message, m.publish_to_channel)
  end
end
